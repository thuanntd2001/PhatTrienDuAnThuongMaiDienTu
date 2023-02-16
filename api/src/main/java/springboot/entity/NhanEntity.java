package springboot.entity;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NHAN")
public class NhanEntity {
	@Id
	@Column(name="TENNHAN")
	private String tenNhan;
	
	@OneToMany(mappedBy = "nhan", fetch = FetchType.LAZY)
	private Collection<TuKhoa_NhanEntity> chiTietNhan= new ArrayList<TuKhoa_NhanEntity>();
	
	@OneToMany(mappedBy = "nhan", fetch = FetchType.LAZY)
	private Collection<Nhan_SanPhamEntity> chiTietSp= new ArrayList<Nhan_SanPhamEntity>();

	public Collection<Nhan_SanPhamEntity> getChiTietSp() {
		return chiTietSp;
	}



	public void setChiTietSp(Collection<Nhan_SanPhamEntity> chiTietSp) {
		this.chiTietSp = chiTietSp;
	}



	@ManyToOne
	@JoinColumn(name = "SANPHAM")
	private SanPhamEntity sanPham;
	public String getTenNhan() {
		return tenNhan;
	}



	public void setTenNhan(String tenNhan) {
		this.tenNhan = tenNhan;
	}




	public Collection<TuKhoa_NhanEntity> getChiTietNhan() {
		return chiTietNhan;
	}



	public void setChiTietNhan(Collection<TuKhoa_NhanEntity> chiTietNhan) {
		this.chiTietNhan = chiTietNhan;
	}



	public SanPhamEntity getSanPham() {
		return sanPham;
	}



	public void setSanPham(SanPhamEntity sanPham) {
		this.sanPham = sanPham;
	}



	public NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
