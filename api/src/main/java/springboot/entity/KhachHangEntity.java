package springboot.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "KHACHHANG")
public class KhachHangEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MAKH")
	private Long maKH;

	@Column(name = "HOTEN")
	private String hoTen;

	@Column(name = "NGAYSINH")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MMM-yyyy")
	private Date ngaySinh;

	@Column(name = "GIOITINH")
	private Boolean gioiTinh;


	@Column(name = "SDT")
	private String sdt;


	@Column(name = "DIACHI")
	private String diaChi;



	@Column(name = "TRANGTHAI")
	private Boolean trangThai;

//	@OneToMany(mappedBy = "nvThucHien", fetch = FetchType.LAZY)
//	private Collection<HoaDonEntity> hoadon;
//
//	@OneToMany(mappedBy = "nvTao", fetch = FetchType.LAZY)
//	private Collection<ChiPhiEntity> chiPhi;

//	@OneToMany(mappedBy = "userkh", fetch = FetchType.LAZY)
//	private Collection<UserKHEntity> userkh;	
	
	@OneToOne(mappedBy = "userkh")
	private UserKHEntity userkh;

	public Long getMaKH() {
		return maKH;
	}

	public void setMaKH(Long maNV) {
		this.maKH = maNV;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public Boolean getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(Boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}


	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}



	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}



	public Boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

//	public Collection<HoaDonEntity> getHoadon() {
//		return hoadon;
//	}
//
//	public void setHoadon(Collection<HoaDonEntity> hoadon) {
//		this.hoadon = hoadon;
//	}
//
//	public Collection<ChiPhiEntity> getChiPhi() {
//		return chiPhi;
//	}
//
//	public void setChiPhi(Collection<ChiPhiEntity> chiPhi) {
//		this.chiPhi = chiPhi;
//	}

	public UserKHEntity getUser() {
		return userkh;
	}

	public void setUser(UserKHEntity userkh) {
		this.userkh = userkh;
	}


	public KhachHangEntity() {
		super();
	}
}
