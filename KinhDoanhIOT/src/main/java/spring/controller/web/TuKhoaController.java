package spring.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.TuKhoaDTO;



@Controller
public class TuKhoaController {

	@RequestMapping(value = "tukhoa" , method = RequestMethod.GET)
	public <E> String showMenu(ModelMap model,HttpServletRequest request) {

		List<TuKhoaDTO> list=null;
		try {
			list = Collector.getListAll("/tukhoa",TuKhoaDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
        
		return "web/tukhoa";
	}
	
}
	