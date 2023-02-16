package springboot.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TUKHOA")
public class TuKhoaEntity {
	@Id
	@Column(name="TENTUKHOA")
	private String tenTuKhoa;
	
	@OneToMany(mappedBy = "tuKhoa", fetch = FetchType.LAZY)
	private Collection<TuKhoa_NhanEntity> chiTietNhan= new ArrayList<TuKhoa_NhanEntity>();


	public String getTenTuKhoa() {
		return tenTuKhoa;
	}



	public void setTenTuKhoa(String tenTuKhoa) {
		this.tenTuKhoa = tenTuKhoa;
	}




	public TuKhoaEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
