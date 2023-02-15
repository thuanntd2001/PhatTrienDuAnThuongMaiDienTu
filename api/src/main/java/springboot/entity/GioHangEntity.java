package springboot.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="GIOHANG")
public class GioHangEntity {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long ID;
	
	@ManyToOne
	@JoinColumn(name="MAKH")
	private KhachHangEntity userkh;

	@ManyToOne
	@JoinColumn(name="SANPHAM")
	private SanPhamEntity sp;
	
	
	
	@Column(name="SOLUONG")
	private Integer soLuong;
	
	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public KhachHangEntity getUserkh() {
		return userkh;
	}

	public void setUserkh(KhachHangEntity userkh) {
		this.userkh = userkh;
	}

	public SanPhamEntity getSp() {
		return sp;
	}

	public void setSp(SanPhamEntity sp) {
		this.sp = sp;
	}



	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}
	
}
