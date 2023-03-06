package spring.controller.khachhang;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeKHController {

	// CONTROLLER
	@RequestMapping(value = "KH-home", method = RequestMethod.GET)
	public String index(HttpServletRequest request, ModelMap model) {
		
		
		return "khachhang/home";
	}


}

