package spring.controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.PhieuNhapDTO;




@Controller
public class NhapHangController {

	@RequestMapping(value = "nhaphang" , method = RequestMethod.GET)
	public <E> String showMenu(ModelMap model,HttpServletRequest request) {

		List<PhieuNhapDTO> list=null;
		try {
			list = Collector.getListAll("/phieunhap",PhieuNhapDTO.class);
			String manv = (String) request.getSession().getAttribute("USERMODEL.userName"); 
			if (manv != null && !manv.isEmpty()) {

	            // Lọc danh sách phiếu nhập theo MANV trong session
	            list = list.stream()
	                    .filter(pn -> pn.getNvThucHien() == Long.parseLong(manv))
	                    .collect(Collectors.toList());
	        } else {
	            // Nếu MANV là null, trả về danh sách rỗng hoặc thông báo lỗi cho người dùng
	            list = new ArrayList<>();
	            // Hoặc model.addAttribute("error", "MANV is null");
	        }
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("list", list);
		
        
		return "web/nhaphang";
	}
	
}