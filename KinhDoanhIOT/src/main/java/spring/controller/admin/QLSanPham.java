package spring.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.bean.Collector;
import spring.dto.LoaiSPDTO;
import spring.dto.SanPhamDTO;

@Controller

@RequestMapping(value = "/admin-home/")
public class QLSanPham {

	// CONTROLLER
	@RequestMapping(value = "admin-qlsanpham", method = RequestMethod.GET)
	public <E> String showSanPham(HttpServletRequest request, ModelMap model) {

		List<SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/sanpham", SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "admin/qlsanpham";
	}

	/* hiển thị form */
	@RequestMapping(value = "formSanPham", method = RequestMethod.GET)
	public String index_formSanPham(ModelMap model) {
		model.addAttribute("td", new SanPhamDTO());

		model.addAttribute("loaisps", getLoaiSPs());

		return "admin/form/inputSanPham";
	}

	

//thêm 
	@RequestMapping(value = "formSanPham", params = "Insert", method = RequestMethod.POST)
	public <E> String addSanPham(HttpServletRequest request, ModelMap model, @ModelAttribute("td") SanPhamDTO td) {
		String error = "";
		Integer temp = 0;
		if (CheckIDSanPham(td.getID())) {
			error = "ID thực đơn đã tồn tại!!!";
		} else {
			String idLoaiTU = request.getParameter("loai");
			String tmp = request.getParameter("gia");
			Integer giaTD = Integer.parseInt(tmp);
			String tenTD = request.getParameter("ten");
			String dvt = request.getParameter("dvt");

			td.setLoai(Long.parseLong(idLoaiTU));
			td.setGia(giaTD);
			td.setTen(tenTD);
			td.setIcon("gi do");
			td.setSlTon(0);
			td.setDvt(dvt);
			td.setTrangThai(1);
			temp = this.insertSanPham(td);
		}
		if (temp != 0) {
			model.addAttribute("message", "Thêm thành công");

		} else {
			model.addAttribute("message", "Thêm thất bại " + error);
		}

		return "redirect:admin-qlsanpham.htm";
	}

	
	
	@RequestMapping(value = "formSanPham", params = "linkEdit" )
	public String editTD_showform (HttpServletRequest request, ModelMap model,@ModelAttribute("td") SanPhamDTO td) {
		
		Long idTD = td.getID();
		model.addAttribute("loais",this.getLoaiSPs());
		Long x = this.getTD(idTD).getLoai();
		model.addAttribute("idloaiTU", td.getLoai());
		
		String ten = this.getTD(idTD).getTen();
		model.addAttribute("ten",ten);
		model.addAttribute("gia",this.getTD(idTD).getGia());

		/*model.addAttribute("td",td);*/
		model.addAttribute("btnupdate","true");
		model.addAttribute("read","true");
		return "admin/form/inputSanPham";
	}

	@RequestMapping(value = "formSanPham", params = "btnupdate" , method = RequestMethod.POST )
	public <E> String editTD(HttpServletRequest requets, ModelMap model, 
			@ModelAttribute("td") SanPhamDTO td) {
		String idLoaiTU =requets.getParameter("loai");	
		td.setLoai(Long.parseLong(idLoaiTU));
		
		
		String tmp =requets.getParameter("gia");
		Integer giaTD = Integer.parseInt(tmp);
		String tenTD =requets.getParameter("ten");
		//td.setid1((long)1);
		td.setGia(giaTD);
		td.setTen(tenTD);
		Integer temp = this.updateTD(td);
		if( temp != 0) {
			model.addAttribute("message", "Cập nhật thành công");	
		}
		else {
			model.addAttribute("message", "Cập nhật không thành công");

		}
		
		return "admin/qlsanpham";
	}
	
	
	
	
	
	@RequestMapping(value = "admin-qlsanpham", params = "linkDelete")
	public <E> String deleteDonNhapHang (HttpServletRequest request, ModelMap model, @ModelAttribute("td") SanPhamDTO td) {
		
		Integer temp = this.deleteSanPham(td);
		if(temp != 0) {
			model.addAttribute("message","Delete thành công");
		}
		else {
			model.addAttribute("message", "Delete không thành công ! Thực đơn đã có trong hóa đơn");
		}
		
		return "admin/qlsanpham";
	}
	public Integer deleteSanPham (SanPhamDTO td) {
		String flag = Collector.delMess("/sanpham", td);
		System.out.println(flag);
		if (flag.equals("00")) {
			return 1;
		} else
			return 0;
	}
	public List<LoaiSPDTO> getLoaiSPs() {
		List<LoaiSPDTO> list = null;
		try {
			list = Collector.getListAll("/loaisp", LoaiSPDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
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

	public List<String> checkInfo(SanPhamDTO td) {
		List<String> listError = new ArrayList<>();

		if (td.getGia() == 0) {
			listError.add("chưa nhập giá thành");
		}
		if (td.getID()==null) {
			listError.add("chưa nhập ID");
		}

		return listError;

	}

	public Integer insertSanPham(SanPhamDTO td) {
		String flag;
		try {
			 flag = Collector.postMess("/sanpham", td);
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

	public boolean CheckIDSanPham(Long IDthucDon) {
		List<SanPhamDTO> list = getSanPhams();
		int n = list.size();
		Long user;
		for (int i = 0; i < n; i++) {
			user = list.get(i).getID();
			if (user==IDthucDon) {
				return true;
			}
		}
		return false;
	}
	public SanPhamDTO getTD (Long id) {
		List<SanPhamDTO> list = null;
		try {
			list = Collector.getListAll("/sanpham", SanPhamDTO.class);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SanPhamDTO ss = new SanPhamDTO();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getID().equals(id))
				ss = list.get(i);
		}
		
		return ss;
	}
	public Integer updateTD(SanPhamDTO td) {
		String flag = Collector.putMess("/sanpham", td);
		System.out.println(flag);
		if (flag.equals("00")){
			return 1;
		} else
			return 0;
	}
}