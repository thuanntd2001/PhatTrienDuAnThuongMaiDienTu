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

import spring.bean.APIFunction;
import spring.dto.LoginKHDTO;
import spring.dto.SanPhamDTO;

@Controller
public class HomeKHController {

	private LoginKHDTO kh;

	// CONTROLLER
	@RequestMapping(value = "khachhanghome", method = RequestMethod.GET)
	public String index(HttpServletRequest request, ModelMap model) {

		if (SessionUtil.getInstance().getValue(request, "LoaiSPs") == null) {
			SessionUtil.getInstance().putValue(request, "LoaiSPs",APIFunction.getLoaiSPs());
		}
		if (SessionUtil.getInstance().getValue(request, "SanPhams") == null) {
			SessionUtil.getInstance().putValue(request, "SanPhams", APIFunction.getSanPhams());
		}
	
		return "khachhang/home";
	}


	@RequestMapping(value = "khachhangsearch-loai", method = RequestMethod.GET)
	public String indexLoai(HttpServletRequest request, ModelMap model) {
		List<SanPhamDTO> sps = APIFunction.getSanPhams();
		List<SanPhamDTO> sps2 = new ArrayList<SanPhamDTO>();
		
		Long idLoai = Long.parseLong(request.getParameter("id"));
		for (int i = 0; i< sps.size();i++) {
			if (sps.get(i).getLoai() == idLoai ) {
				sps2.add(sps.get(i));
			}
		}
		model.addAttribute("LoaiSPs", APIFunction.getLoaiSPs());
		
		
		model.addAttribute("SanPhams",sps2);

		return "khachhang/home";
	}

	
}
