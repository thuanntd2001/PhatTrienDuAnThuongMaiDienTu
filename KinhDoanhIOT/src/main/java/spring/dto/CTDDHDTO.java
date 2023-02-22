package spring.dto;

//@Entity
//@Table(name = "CTDDH")
public class CTDDHDTO {	

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
	private Long ddh;

	public Long getSanPham() {
		return sanPham;
	}

	public void setSanPham(Long sanPham) {
		this.sanPham = sanPham;
	}

	public Long getDdh() {
		return ddh;
	}

	public void setDdh(Long ddh) {
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
