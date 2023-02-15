package springboot.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "NHAN_SANPHAM")
public class Nhan_SanPhamEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "ID")
	private Long id;

	@OneToMany
	@JoinColumn(name="SANPHAM_ID")
	private SanPhamEntity sanPham;
	
	@OnetoMany
	@JoinColumn(name="NHAN_ID")
	private NhanEntity nhan;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public SanPhamEntity getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPhamEntity sanPham) {
		this.sanPham = sanPham;
	}
	
	public NhanEntity getNhan() {
		return nhan;
	}

	public void setNhan(NhanEntity nhan) {
		this.nhan = nhan;
	}

	public Nhan_SanPhamEntity(String id,SanPhamEntity sanPham, NhanEntity nhan) {
		super();
		this.id = id;
		this.sanPham = sanPham;
		this.nhan = nhan;
	}

	public 	Nhan_SanPhamEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
