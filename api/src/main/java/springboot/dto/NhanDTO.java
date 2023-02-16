package springboot.dto;

//@Entity
//@Table(name = "NHAN")
public class NhanDTO {
	//@Id
	//@Column(name="TENNHAN")
	private String tenNhan;
	


	public Long getSanPham() {
		return sanPham;
	}



	public void setSanPham(Long sanPham) {
		this.sanPham = sanPham;
	}




	//@ManyToOne
	//@JoinColumn(name = "SANPHAM")
	private Long sanPham;
	public String getTenNhan() {
		return tenNhan;
	}



	public void setTenNhan(String tenNhan) {
		this.tenNhan = tenNhan;
	}




	public NhanDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


}
