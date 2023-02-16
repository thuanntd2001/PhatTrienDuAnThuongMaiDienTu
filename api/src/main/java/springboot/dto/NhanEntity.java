package springboot.dto;

//@Entity
//@Table(name = "NHAN")
public class NhanEntity {
	//@Id
	//@Column(name="TENNHAN")
	private String tenTuKhoa;
	


	public Long getSanPham() {
		return sanPham;
	}



	public void setSanPham(Long sanPham) {
		this.sanPham = sanPham;
	}




	//@ManyToOne
	//@JoinColumn(name = "SANPHAM")
	private Long sanPham;
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
