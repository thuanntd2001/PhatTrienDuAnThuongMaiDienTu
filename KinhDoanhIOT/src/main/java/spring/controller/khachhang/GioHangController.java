package spring.controller.khachhang;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quancafehighland.utils.SessionUtil;

import spring.bean.Collector;
import spring.bean.GioHangForm;
import spring.dto.GioHangDTO;
import spring.dto.LoaiSPDTO;
import spring.dto.LoginKHDTO;
import spring.dto.SanPhamDTO;

@Controller

public class GioHangController {

	// CONTROLLER
	@RequestMapping(value = "KH-giohang", method = RequestMethod.GET)
	public <E> String showGioHang(HttpServletRequest request, ModelMap model) {
		LoginKHDTO kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");

		List<GioHangDTO> gioHangs = getGioHangs(kh.getMaKH());

		GioHangForm ghf = new GioHangForm();
		ghf.setGioHangs(gioHangs);

		model.addAttribute("gioHangForm", ghf);

		List<SanPhamDTO> lstSPs = getSanPhams();
		List<SanPhamDTO> spGioHang = new ArrayList<SanPhamDTO>();
		for (GioHangDTO gh : gioHangs) {
			SanPhamDTO sp = this.getSP(gh.getMaSP(), lstSPs);
			spGioHang.add(sp);
		}
		model.addAttribute("spGioHang", spGioHang);

		return "khachhang/giohang";

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

		String check=this.postGioHang(gh);
		if (check.equals("00"))
			model.addAttribute("Them SP thanh cong");
		else 
			model.addAttribute("Them SP that bai");
		return "redirect:KH-giohang.htm";

	}

	public List<GioHangDTO> getGioHangs(Long id) {
		List<GioHangDTO> list = null;
		try {
			list = Collector.getListAll("/giohang?makh=" + id.toString(), GioHangDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public String postGioHang(GioHangDTO gh) {
		String check;
		check = Collector.postMess("/giohang", gh);

		return check;
	}


	public List<SanPhamDTO> getSanPhams() {
		List<SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/sanpham", SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public LoaiSPDTO findOneLoai(Long id) {
		List<LoaiSPDTO> list = null;
		try {
			list = Collector.getListAll("/loaisp", LoaiSPDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LoaiSPDTO ss = new LoaiSPDTO();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId().equals(id))
				ss = list.get(i);
		}

		return ss;
	}

	public SanPhamDTO getSP(Long id, List<SanPhamDTO> list) {

		SanPhamDTO ss = null;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getID().equals(id))
				ss = list.get(i);
		}

		return ss;
	}

}