package spring.controller.admin;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.DDHDTO;

@Controller

@RequestMapping(value = "/admin-home/")
public class QLDDHController {


	// CONTROLLER
	@RequestMapping(value = "admin-ddh", method = RequestMethod.GET)
	public <E> String showDDH(HttpServletRequest request,ModelMap model){	

		List<DDHDTO> list=null;
		try {
			list = Collector.getListAll("/ddh",DDHDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		
		return "admin/qlddh";
	}
	
//	phần tìm kiếm

	@RequestMapping(value="admin-ddh", params = "btnsearch", method=RequestMethod.POST)
	public <E> String searchDDH(HttpServletRequest request, ModelMap model) {
	
		
		return "admin/qlddh";
	}
	
}