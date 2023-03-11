package spring.controller.khachhang;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quancafehighland.utils.SessionUtil;

import spring.bean.Collector;
import spring.dto.CTDDHDTO;
import spring.dto.DDHDTO;
import spring.dto.LoginKHDTO;

@Controller

public class TheoDoiDDHController {

	// CONTROLLER
	@RequestMapping(value = "KHdonhang", method = RequestMethod.GET)
	public <E> String showDonHang(HttpServletRequest request, ModelMap model) {
		LoginKHDTO kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");
		System.out.println(kh.getMaKH());

		List<DDHDTO> list=null;
		try {
			list = Collector.getListAll("/ddh",DDHDTO.class);
			list = list.stream()
                    .filter(ddh -> ddh.getKhThucHien() == kh.getMaKH())
                    .collect(Collectors.toList());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
        
		return "khachhang/QLDDH";
	}
	
	@RequestMapping(value = "KHdonhang", params = "linkView")
	public <E> String xemChiTietHD(HttpServletRequest request, ModelMap model
			) throws IOException {
		
		Long id= Long.parseLong(request.getParameter("id"));

		List<CTDDHDTO> cthds = this.getCtDDHs(id);

		
		  model.addAttribute("chiTiet", cthds);
		 
		int tong = 0;
		for (CTDDHDTO ctpn : cthds) {
			tong += ctpn.getTongTien();
		}
		model.addAttribute("tongTien", tong);
		model.addAttribute("idddh", id);
		
		return "khachhang/QLCTDDH";
	}


	public List<CTDDHDTO> getCtDDHs(Long idpn) {
		List<CTDDHDTO> list = null;
		try {
			list = Collector.getListAll("/ctddh?maddh=" + idpn.toString(), CTDDHDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	






}