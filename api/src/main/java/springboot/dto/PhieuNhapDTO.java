package springboot.dto;

import java.util.Date;

import springboot.entity.PhieuNhapEntity;

//@Entity
//@Table(name = "PHIEUNHAP")
public class PhieuNhapDTO {
	public PhieuNhapDTO(PhieuNhapEntity model) {
		super();
		this.setId(model.getId());
		this.setNgayThucHien(model.getNgayThucHien());
		this.setNvThucHien(model.getNvThucHien().getMaNV());
		this.setTinhTrang(model.getTinhTrang());
		this.setNcc(model.getNcc());
	}

	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(name = "MAPN")
	private Long id;

	//@Column(name = "NGAY")
	//@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	private Date ngayThucHien;



	//@ManyToOne
	//@JoinColumn(name = "MANV")
	private Long nvThucHien;
	
	//@Column(name = "NHACC")
	private String ncc;

	

	public Long getNvThucHien() {
		return nvThucHien;
	}

	//@Column(name = "TINHTRANG")
	private Integer tinhTrang;

	public void setNvThucHien(Long nvThucHien) {
		this.nvThucHien = nvThucHien;
	}



	public String getNcc() {
		return ncc;
	}



	public void setNcc(String ncc) {
		this.ncc = ncc;
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

	
	public PhieuNhapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
