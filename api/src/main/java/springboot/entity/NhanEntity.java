package springboot.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NHAN")
public class NhanEntity {
	@Id
	@Column(name="TENNHAN")
	private String tenTuKhoa;
	
	@OneToMany(mappedBy = "nhan", fetch = FetchType.LAZY)
	private Collection<TuKhoa_NhanEntity> chiTietTuKhoa= new ArrayList<TuKhoa_NhanEntity>();

	@ManyToOne
	@JoinColumn(name = "SANPHAM")
	private SanPhamEntity sanPham;
	public String getTenTuKhoa() {
		return tenTuKhoa;
	}



	public void setTenTuKhoa(String tenTuKhoa) {
		this.tenTuKhoa = tenTuKhoa;
	}




	public NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
