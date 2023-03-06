package spring.controller.web;

import java.io.IOException;
import java.security.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.NhanDTO;
import spring.dto.NhanVienDTO;
import spring.dto.Nhan_SanPhamDTO;
import spring.dto.PhieuNhapDTO;
import spring.dto.SanPhamDTO;




@Controller
public class NhanController {

	@RequestMapping(value = "nhan" , method = RequestMethod.GET)
	public <E> String showMenu(ModelMap model,HttpServletRequest request) {

		List<NhanDTO> list=null;
		try {
			list = Collector.getListAll("/nhan",NhanDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("list", list);
		
        
		return "web/nhan";
	}
	
	
	
	
	
	/* hiển thị form */
	@RequestMapping(value = "formNhan", method = RequestMethod.GET)
	public String index_formSanPham(ModelMap model, @ModelAttribute("nsp") NhanDTO nsp) {
		if (nsp == null) {
			model.addAttribute("nsp", new NhanDTO());
		} else {
			model.addAttribute("sanphams", getSanPhams());
		}
		return "web/form/inputNhanSP";
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
	
	
	
	
	@RequestMapping(value = "formNhan", params = "Insert", method = RequestMethod.POST)
	public String addNhan(HttpServletRequest request, ModelMap model, @ModelAttribute("nsp") NhanDTO nsp) {
		nsp.setNvTao((long) 2);
		
		nsp.setNgayTao(new Date());

		List<String> listError = checkInfo(nsp);
		Integer temp = this.insertNhanSP(nsp);

		if (temp != 0) {
			model.addAttribute("message", "Thêm thành công");

			nsp = new NhanDTO();

		} else {
			model.addAttribute("message", "Thêm thất bại! " + listError);
		}

		return "web/nhan";
	}

	public List<String> checkInfo(NhanDTO nsp) {

		List<String> listError = new ArrayList<>();

		return listError;

	}
	
	
	

	public Integer insertNhanSP(NhanDTO nsp) {
		String flag = Collector.postMess("/nhan", nsp);
		System.out.println(flag);
		if (flag.equals("00")) {
			return 1;
		} else
			return 0;

	}
	
	
	
	
}
	
	
	
	


	
	
	