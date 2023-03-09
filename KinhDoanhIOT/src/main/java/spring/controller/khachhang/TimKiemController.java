package spring.controller.khachhang;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.LoaiSPDTO;
import spring.dto.Nhan_SanPhamDTO;
import spring.dto.SanPhamDTO;

@Controller

public class TimKiemController {

	// CONTROLLER

	@RequestMapping(value = "khachhangtimkiem", method = RequestMethod.GET)
	public String indexLoai(HttpServletRequest request, ModelMap model) {
		List<SanPhamDTO> sps2 = null;

		String tenNhan = request.getParameter("searchnhan");
		sps2 = this.locTheoNhan(tenNhan);
		model.addAttribute("SanPhams", sps2);
		model.addAttribute("LoaiSPs", getLoaiSPs());

		return "khachhang/home";
	}

	public List<Nhan_SanPhamDTO> getNhanSPs(String tenNhan) {
		List<Nhan_SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/nhansanpham?tennhan=" + tenNhan, Nhan_SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
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

	public SanPhamDTO getSP(Long id) {
		List<SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/sanpham", SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SanPhamDTO ss = new SanPhamDTO();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getID().equals(id))
				ss = list.get(i);
		}

		return ss;
	}

	public List<SanPhamDTO> locTheoNhan(String tenNhan) {
		List<SanPhamDTO> sps2 = new ArrayList<SanPhamDTO>();

		List<Nhan_SanPhamDTO> nsps = this.getNhanSPs(tenNhan);
		for (Nhan_SanPhamDTO nsp : nsps) {
			sps2.add(this.getSP(nsp.getSanPham()));
		}

		return sps2;
	}
	
	
	public List<LoaiSPDTO> getLoaiSPs() {
		List<LoaiSPDTO> list = null;
		try {
			list = Collector.getListAll("/loaisp", LoaiSPDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}