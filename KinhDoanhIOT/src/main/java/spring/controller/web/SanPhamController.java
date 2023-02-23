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
public class SanPhamController {


	@RequestMapping(value = "sanpham", method = RequestMethod.GET)
	public String showMenu(ModelMap model, HttpServletRequest request) throws IOException {
		
		List<SanPhamDTO> list = Collector.getListAll("/sanpham",SanPhamDTO.class);
		model.addAttribute("list", list);
		return "web/menu";
	}

	@RequestMapping(value = "sanpham", params="btnsearch")
	public <E> String showMenu2(ModelMap model, HttpServletRequest request) {
		
	
		return "web/menu";
	}
	

	
}