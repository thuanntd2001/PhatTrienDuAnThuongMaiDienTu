package spring.dto;

//@Entity
//@Table(name = "NHAN_SANPHAM")
public class Nhan_SanPhamDTO {
	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(name = "ID")
	private Long id;

	//@ManyToOne
	//@JoinColumn(name = "SANPHAM")
	private Long SanPham;
	
	//@ManyToOne
	//@JoinColumn(name = "TENNHAN")
	private String nhan;

	


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}







	public Long getSanPham() {
		return SanPham;
	}


	public void setSanPham(Long sanPham) {
		SanPham = sanPham;
	}


	public String getNhan() {
		return nhan;
	}


	public void setNhan(String nhan) {
		this.nhan = nhan;
	}


	public 	Nhan_SanPhamDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
