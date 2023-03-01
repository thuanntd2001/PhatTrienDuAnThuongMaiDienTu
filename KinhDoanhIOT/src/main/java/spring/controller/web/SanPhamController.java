package spring.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.SanPhamDTO;




@Controller
@RequestMapping(value = "/nhanvien-home/")
public class SanPhamController {

	//CONTROLLER
	@RequestMapping(value = "nhanvien-qlsanpham", method = RequestMethod.GET)
	public <E> String showSanPham(HttpServletRequest request, ModelMap model) {

		List<SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/sanpham", SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "nhanvien/qlsanpham";
	}
	
	/* hiển thị form */
	@RequestMapping(value = "formSanPham", method = RequestMethod.GET)
	public String index_formSanPham(ModelMap model) {
		model.addAttribute("td", new SanPhamDTO());

		model.addAttribute("loaisps", getLoaiSPs());

		return "admin/form/inputSanPham";
	}

	

	
}