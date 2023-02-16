package springboot.dto;

//@Entity
//@Table(name = "CTDDH")
public class CTDDHEntity {	

	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(name = "ID")
	private Long id;

	//@Column(name = "SOLUONG")
	private Integer soLuong;

	//@ManyToOne
	//@JoinColumn(name = "SANPHAM")
	private Long sanPham;

	//@ManyToOne
	//@JoinColumn(name = "MADDH")
	private DDHEntity ddh;

	public Long getSanPham() {
		return sanPham;
	}

	public void setSanPham(Long sanPham) {
		this.sanPham = sanPham;
	}

	public DDHEntity getDdh() {
		return ddh;
	}

	public void setDdh(DDHEntity ddh) {
		this.ddh = ddh;
	}

	//@Column(name = "TONGTIEN")
	private Integer tongTien;

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	

	public Integer getTongTien() {
		return tongTien;
	}

	public void setTongTien(Integer tongTien) {
		this.tongTien = tongTien;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
