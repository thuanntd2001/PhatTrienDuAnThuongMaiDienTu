package spring.controller.web;

import java.io.IOException;
import java.security.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.NhanDTO;
import spring.dto.Nhan_SanPhamDTO;
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
	public String index_formSanPham(ModelMap model) {
		model.addAttribute("nsp", new NhanDTO());

		model.addAttribute("sanphams", getSanPhams());
		

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
	public <E> String addNhan(HttpServletRequest request, ModelMap model, @ModelAttribute("nsp") NhanDTO nsp) {
		String error = "";
		Integer temp = 0;
		String tenNhan = request.getParameter("tenNhan");

		
		
		String dateInString1 = request.getParameter("ngayvaolam");
		Date ngayvaolam;
		try {
			ngayvaolam = DateUtils.parseDate(dateInString1, new String[] { "yyyy-MM-dd", "dd/MM-yyyy" });
			nsp.setNgayTao(ngayvaolam);
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		nsp.setTenNhan(tenNhan);
		nsp.setNvTao(getNvThucHienFromSession(request));
		temp = this.insertNhanSP(nsp);
		
		if (temp != 0) {
			model.addAttribute("message", "Thêm thành công");

		} else {
			model.addAttribute("message", "Thêm thất bại " + error);
		}

		return "redirect:nhan.htm";
	}
	
	private long getNvThucHienFromSession(HttpServletRequest request) {
	    String manv = (String) request.getSession().getAttribute("USERMODEL.userName");
	    if (manv == null) {
	        return 1;
	    }
	    return Long.parseLong(manv);
	}
	
	
	public Integer insertNhanSP(NhanDTO nsp) {
		String flag;
		try {
			 flag = Collector.postMess("/nhan", nsp);
			System.out.println(flag);
		}
		catch(Exception e) {
			System.out.println("loi api");
			e.printStackTrace();
			return 0;
		}
		
		if (flag.equals("00")) {
			return 1;
		} else
			return 0;
	}
	
	
	
}



	
	
	