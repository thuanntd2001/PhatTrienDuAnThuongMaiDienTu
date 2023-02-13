package springboot.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="GIOHANG")
public class GioHangEntity {
	@Id
	@Column(name="ID")
	private Long ID;
	
	@ManyToOne
	@JoinColumn(name="MAKH")
	private KhachHangEntity userkh;

	@ManyToOne
	@JoinColumn(name="SANPHAM")
	private SanPhamEntity sp;
	
	@Column(name="TONGTIEN")
	private Integer tongTien;
	
	@Column(name="SOLUONG")
	private Integer soLuong;
	
}
