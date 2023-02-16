package springboot.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "DONDATHANG")
public class DDHEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MADDH")
	private Long id;

	@Column(name = "NGAYTHUCHIEN")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	private Date ngayThucHien;

	@OneToMany(mappedBy = "ddh", fetch = FetchType.LAZY)
	private Collection<CTDDHEntity> chiTietHD= new ArrayList<CTDDHEntity>();


	@ManyToOne
	@JoinColumn(name = "NVXACNHAN")
	private NhanVienEntity nvThucHien;
	
	@ManyToOne
	@JoinColumn(name = "MAKH")
	private NhanVienEntity khThucHien;
	

	public NhanVienEntity getNvThucHien() {
		return nvThucHien;
	}

	@Column(name = "TINHTRANG")
	private Integer tinhTrang;

	public void setNvThucHien(NhanVienEntity nvThucHien) {
		this.nvThucHien = nvThucHien;
	}



	public Integer getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(Integer tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getNgayThucHien() {
		return ngayThucHien;
	}

	public void setNgayThucHien(Date ngayThucHien) {
		this.ngayThucHien = ngayThucHien;
	}

	

	public NhanVienEntity getKhThucHien() {
		return khThucHien;
	}

	public void setKhThucHien(NhanVienEntity khThucHien) {
		this.khThucHien = khThucHien;
	}

	public DDHEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
