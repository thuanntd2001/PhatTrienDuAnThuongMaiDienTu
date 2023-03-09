package spring.controller.khachhang;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quancafehighland.utils.SessionUtil;

import spring.bean.APIFunction;
import spring.bean.GioHangForm;
import spring.dto.CTDDHDTO;
import spring.dto.DDHDTO;
import spring.dto.GioHangDTO;
import spring.dto.LoginKHDTO;
import spring.dto.SanPhamDTO;

@Controller

public class GioHangController {

	// CONTROLLER
	@RequestMapping(value = "KH-giohang", method = RequestMethod.GET)
	public <E> String showGioHang(HttpServletRequest request, ModelMap model) {
		LoginKHDTO kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");

		List<GioHangDTO> gioHangs = 	APIFunction.getGioHangs(kh.getMaKH());

		GioHangForm ghf = new GioHangForm();
		ghf.setGioHangs(gioHangs);

		model.addAttribute("gioHangForm", ghf);

		List<SanPhamDTO> lstSPs = 	APIFunction.getSanPhams();
		List<SanPhamDTO> spGioHang = new ArrayList<SanPhamDTO>();
		for (GioHangDTO gh : gioHangs) {
			SanPhamDTO sp = APIFunction.getSP(gh.getMaSP(), lstSPs);
			spGioHang.add(sp);
		}
		model.addAttribute("spGioHang", spGioHang);

		return "khachhang/giohang";

	}

	@RequestMapping(value = "KH-giohang", method = RequestMethod.POST)
	public <E> String taoDDH(HttpServletRequest request, ModelMap model,
			@ModelAttribute("gioHangForm") GioHangForm gioHangForm) {
		LoginKHDTO kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");

		List<GioHangDTO> gioHangs = gioHangForm.getGioHangs();
		List<SanPhamDTO> lstSPs = APIFunction.getSanPhams();


		DDHDTO ddh = new DDHDTO();
		ddh.setKhThucHien(kh.getMaKH());
		ddh.setNgayThucHien(new Date());
		ddh.setTinhTrang(0);

		
		List<CTDDHDTO> cts = new ArrayList<CTDDHDTO>();
		CTDDHDTO ct= null;
		for (GioHangDTO giohang : gioHangs) {
			ct = new CTDDHDTO();
			ct.setSanPham(giohang.getMaSP());
			ct.setSoLuong(giohang.getSoLuong());
			
			
//			System.out.println(giohang.getMaSP());
//			System.out.println(lstSPs);
//
//			System.out.println(APIFunction.getSP(giohang.getMaSP(), lstSPs));
			ct.setTongTien(giohang.getSoLuong()* APIFunction.getSP(giohang.getMaSP(), lstSPs).getGia());
			cts.add(ct);
					
		}
		ddh.setCtddhs(cts);


		String check = APIFunction.postDDH(ddh);
		if (check.equals("00")) {
			model.addAttribute("message","Dat hang thanh cong");
			for (GioHangDTO gh : gioHangs) {
				check = APIFunction.delGioHang(gh);
				if (!check.equals("00")) {
					model.addAttribute("message","RESET gio hang that bai");
					break;
				}

			}
		}
		else 		model.addAttribute("message","Dat hang that bai");


		 return "redirect:KH-giohang.htm";


	}

	@RequestMapping(value = "KH-giohangthem", method = RequestMethod.GET)
	public <E> String lenSanPham(HttpServletRequest request, ModelMap model) {
		LoginKHDTO kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");
		Long idsp = Long.parseLong(request.getParameter("id"));
		Integer sl = Integer.parseInt(request.getParameter("sl"));

		GioHangDTO gh = new GioHangDTO();

		gh.setMaKH(kh.getMaKH());
		gh.setMaSP(idsp);
		gh.setSoLuong(sl);

		String check = APIFunction.postGioHang(gh);
		if (check.equals("00"))
			model.addAttribute("message","Them SP thanh cong");
		else
			model.addAttribute("message","Them SP that bai");
		return "redirect:KH-giohang.htm";

	}

	

}