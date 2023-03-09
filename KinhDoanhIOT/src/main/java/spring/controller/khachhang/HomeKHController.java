package spring.controller.khachhang;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.quancafehighland.utils.SessionUtil;

import spring.bean.APIFunction;
import spring.dto.LoginKHDTO;

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
		kh = (LoginKHDTO) SessionUtil.getInstance().getValue(request, "USERKHMODEL");
		if (kh== null) {
		model.addAttribute("slgh",0);
		SessionUtil.getInstance().putValue(request, "slgh", 0);
		}
		else {
		model.addAttribute("slgh",APIFunction.getGioHangs(kh.getMaKH()).size());
		SessionUtil.getInstance().putValue(request, "slgh", APIFunction.getGioHangs(kh.getMaKH()).size());
		}
		return "khachhang/home";
	}

	@RequestMapping(value = "khachhanghome", params = "linkLoai", method = RequestMethod.GET)
	public String indexLoai(HttpServletRequest request, ModelMap model) {
		if (SessionUtil.getInstance().getValue(request, "LoaiSPs") == null) {
			SessionUtil.getInstance().putValue(request, "LoaiSPs", APIFunction.getLoaiSPs());
		}
		if (SessionUtil.getInstance().getValue(request, "SanPhams") == null) {
			SessionUtil.getInstance().putValue(request, "SanPhams", APIFunction.getSanPhams());
		}

		return "khachhang/home";
	}

	
}
