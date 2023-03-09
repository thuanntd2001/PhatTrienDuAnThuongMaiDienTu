package spring.controller.khachhang;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.APIFunction;
import spring.dto.SanPhamDTO;

@Controller

public class CTSPController {

	// CONTROLLER
	@RequestMapping(value = "khachhang-ctsp.htm", method = RequestMethod.GET)
	public <E> String showSanPham(HttpServletRequest request, ModelMap model) {
		Long idTD = Long.parseLong(request.getParameter("id"));
		SanPhamDTO td = APIFunction.getSP(idTD);
		model.addAttribute("td", td);
		model.addAttribute("loai", APIFunction.findOneLoai(td.getLoai()));

		return "khachhang/ctsp";

	}





	

}