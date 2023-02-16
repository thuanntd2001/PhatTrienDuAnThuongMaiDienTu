package springboot.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PHIEUNHAP")
public class PhieuNhapEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MAPN")
	private Long id;

	@Column(name = "NGAY")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	private Date ngayThucHien;



	@ManyToOne
	@JoinColumn(name = "MANV")
	private NhanVienEntity nvThucHien;
	
	@Column(name = "NHACC")
	private String ncc;

	

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

	
	public PhieuNhapEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
