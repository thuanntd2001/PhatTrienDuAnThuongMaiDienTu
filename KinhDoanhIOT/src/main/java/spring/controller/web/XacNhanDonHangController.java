package spring.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.CTDDHDTO;
import spring.dto.CTPNDTO;
import spring.dto.ChiTietHDDTO;
import spring.dto.DDHDTO;
import spring.dto.HoaDonDTO;
import spring.dto.PhieuNhapDTO;
import spring.dto.TuKhoaDTO;



@Controller
public class XacNhanDonHangController {

	@RequestMapping(value = "xacnhanDH" , method = RequestMethod.GET)
	public <E> String showMenu(ModelMap model,HttpServletRequest request) {

		List<DDHDTO> list=null;
		try {
			list = Collector.getListAll("/ddh",DDHDTO.class);
			list = list.stream()
                    .filter(ddh -> ddh.getTinhTrang() == 0)
                    .collect(Collectors.toList());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
        
		return "web/xacnhandh";
	}
	
	@RequestMapping(value = "xacnhandh/{id}.htm", params = "linkView")
	public <E> String xemChiTietDDH(HttpServletRequest request, ModelMap model, @PathVariable("id") Long id) {
		List<CTDDHDTO> cthds = this.getCtDDHs(id);

		
		  model.addAttribute("chiTiet", cthds);
		 
		int tong = 0;
		for (CTDDHDTO ctpn : cthds) {
			tong += ctpn.getTongTien();
		}
		model.addAttribute("tongTien", tong);
		model.addAttribute("idhd", id);
		return "web/CTDDH";
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
	
	
	@RequestMapping(value = "xacnhanddh", params = "btnupdate", method = RequestMethod.POST)
	public String edit_NhapHang(HttpServletRequest requets, ModelMap model, @ModelAttribute("pn") DDHDTO nh) {
		/*
		 * UserModel user1 = (UserModel) SessionUtil.getInstance().getValue(requets,
		 * "USERMODEL"); nh.setCpnv(user1.getUsernv());
		 */
		DDHDTO cp = new DDHDTO();
		cp = getDonDatHang(nh.getKhThucHien());
		nh.setTinhTrang((int) 1);

		List<String> listError = checkInfo(nh);
		Integer temp = this.updateNH(nh);
		if (temp != 0) {
			model.addAttribute("message", "Cập nhật thành công");

		} else {
			model.addAttribute("message", "Cập nhật không thành công! " + listError);

		}

		// model.addAttribute("bans", list);
		return "web/xacnhanddh";
	}
	
	public List<String> checkInfo(DDHDTO cp) {

		List<String> listError = new ArrayList<>();

		return listError;

	}


	



	public DDHDTO getDonDatHang(long id) {
		List<DDHDTO> list = null;
		try {
			list = Collector.getListAll("/ddh", DDHDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DDHDTO ss = new DDHDTO();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getKhThucHien() == id)
				ss = list.get(i);
		}

		return ss;
	}

	public Integer updateNH(DDHDTO nh) {
		String flag = Collector.putMess("/ddh", nh);
		System.out.println(flag);
		if (flag.equals("00")) {
			return 1;
		} else
			return 0;
	}

	
}