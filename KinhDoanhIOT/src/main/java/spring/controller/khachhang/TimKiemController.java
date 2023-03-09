package spring.controller.khachhang;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.LoaiSPDTO;
import spring.dto.SanPhamDTO;

@Controller

public class TimKiemController {

	// CONTROLLER
	@RequestMapping(value = "khachhangtimkiembar.htm", method = RequestMethod.GET)
	public <E> String showSanPham(HttpServletRequest request, ModelMap model) {
		Long idTD = Long.parseLong(request.getParameter("id"));
		SanPhamDTO td = this.getSP(idTD);
		model.addAttribute("td", td);
		model.addAttribute("loai", this.findOneLoai(td.getLoai()));

		return "khachhang/ctsp";

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
	public LoaiSPDTO findOneLoai (Long id) {
		List<LoaiSPDTO> list = null;
		try {
			list = Collector.getListAll("/loaisp", LoaiSPDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LoaiSPDTO ss = new LoaiSPDTO();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getId().equals(id))
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

}