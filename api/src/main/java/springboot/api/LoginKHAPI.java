package springboot.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import springboot.dto.LoginDTO;
import springboot.entity.KhachHangEntity;
import springboot.entity.UserKHEntity;
import springboot.repository.KhachHangRepository;
import springboot.repository.UserKHRepository;

@RestController
public class LoginKHAPI {
	@Autowired
	UserKHRepository urepo;
	@Autowired
	KhachHangRepository khrepo;


	@PostMapping(value = "/loginkh")
	public LoginDTO checkUserNameAndPass(@RequestBody LoginDTO model) {

	
		UserKHEntity user = urepo.findByUserNameAndPasswd(model.getUserName(),model.getPasswd());
		if (user==null) {
		return null;
		}
		else {
			
			LoginDTO e=new LoginDTO();
			KhachHangEntity kh=user.getUserkh();
			e.setMaKH(kh.getMaKH());
			e.setDiaChi(kh.getDiaChi());
			e.setGioiTinh(kh.getGioiTinh());
			e.setHoTen(kh.getHoTen());
			e.setNgaySinh(kh.getNgaySinh());
			e.setSdt(kh.getSdt());
			e.setEmail(user.getEmail());
			e.setIcon(user.getIcon());
			//e.setID(user.getUserkh().getMaNV());
			e.setPasswd(user.getPasswd());
			e.setStatus(user.getStatus());
			e.setUserName(user.getUserName());
			return e;
		}
	}

	

}
