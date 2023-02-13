package springboot.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import springboot.dto.KhachHangDTO;
import springboot.entity.KhachHangEntity;
import springboot.repository.KhachHangRepository;

@RestController
public class KhachHangAPI {
	@Autowired
	KhachHangRepository repo;

	@GetMapping("/khachhang")
	public List<KhachHangDTO> getKhachHang() {
		List<KhachHangEntity> list = repo.findAllActive();
		List<KhachHangDTO> listDTO = new ArrayList<KhachHangDTO>();
		for (KhachHangEntity item : list) {
			KhachHangDTO e = new KhachHangDTO();
			e.setMaKH(item.getMaKH());
			e.setDiaChi(item.getDiaChi());
			e.setGioiTinh(item.getGioiTinh());
			e.setHoTen(item.getHoTen());
			e.setNgaySinh(item.getNgaySinh());
			e.setSdt(item.getSdt());
			
			
			listDTO.add(e);
		}
		System.out.print(list.size());
		return listDTO;
	}

	@PostMapping(value = "/khachhang")
	public String createKH(@RequestBody KhachHangDTO model) {

		KhachHangEntity save = new KhachHangEntity();
		KhachHangEntity check = null;
		try {
			save.setTrangThai(model.getTrangThai());
			save.setDiaChi(model.getDiaChi());
			save.setGioiTinh(model.getGioiTinh());
			save.setHoTen(model.getHoTen());
			save.setNgaySinh(model.getNgaySinh());
			save.setSdt(model.getSdt());

			check = repo.save(save);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print(model.getHoTen());
			return "01";
		}
		if (check == null) {

			return "02";
		}
		return "00";
	}

	@PutMapping(value = "/khachhang")
	public String updateKH(@RequestBody KhachHangDTO model) {

		Optional<KhachHangEntity> khoption = repo.findById(model.getMaKH());
		if (khoption.isEmpty()) {

			System.out.print("ko tồn tại kh");
			return "404";
		}

		else {
			System.out.print("tồn tại kh");
			KhachHangEntity save = khoption.get();
			KhachHangEntity check = null;
			try {

				save.setDiaChi(model.getDiaChi());
				save.setGioiTinh(model.getGioiTinh());
				save.setHoTen(model.getHoTen());
				save.setNgaySinh(model.getNgaySinh());
				save.setSdt(model.getSdt());
				save.setTrangThai(model.getTrangThai());
				check = repo.save(save);
			} catch (Exception e) {
				e.printStackTrace();
				return "01";
			}

			if (check == null) {
				return "02";
			}
			return "00";
		}

	}

	@PatchMapping(value = "/khachhang")
	public String deleteKH(@RequestBody KhachHangDTO ids) {
		Optional<KhachHangEntity> khoption = repo.findById(ids.getMaKH());
		if (khoption.isEmpty()) {

			System.out.print("ko tồn tại kh");
			return "404";
		}

		else {
			System.out.print("tồn tại kh");
			KhachHangEntity save = khoption.get();
			KhachHangEntity check = null;
			try {

				save.setTrangThai(true);
				check = repo.save(save);

			} catch (Exception e) {
				e.printStackTrace();
				return "01";
			}

			if (check == null) {
				return "02";
			}
			return "00";
		}

	}

}
