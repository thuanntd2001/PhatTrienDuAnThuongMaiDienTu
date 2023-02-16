package springboot.dto;

import java.util.Date;

//@Entity
//@Table(name = "DONDATHANG")
public class DDHEntity {
	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(name = "MADDH")
	private Long id;

	//@Column(name = "NGAYTHUCHIEN")
	//@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
	private Date ngayThucHien;

	//@OneToMany(mappedBy = "ddh", fetch = FetchType.LAZY)


	//@ManyToOne
	//@JoinColumn(name = "NVXACNHAN")
	private Long nvThucHien;
	
	//@ManyToOne
	//@JoinColumn(name = "MAKH")
	private Long khThucHien;
	

	public Long getNvThucHien() {
		return nvThucHien;
	}

	//@Column(name = "TINHTRANG")
	private Integer tinhTrang;

	public void setNvThucHien(Long nvThucHien) {
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

	

	public Long getKhThucHien() {
		return khThucHien;
	}

	public void setKhThucHien(Long khThucHien) {
		this.khThucHien = khThucHien;
	}

	public DDHEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
