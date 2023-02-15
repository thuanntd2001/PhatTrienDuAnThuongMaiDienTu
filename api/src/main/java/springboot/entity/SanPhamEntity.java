package springboot.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SANPHAM")
public class SanPhamEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private Long id;
	@Column(name = "HOTEN")
	private String hoTen;


	@Column(name = "GIA")
	private Integer gia;
	
	@Column(name = "SOLUONGTON")
	private Integer slTon;

	@Column(name = "DONVITINH")
	private String dvTinh;

	@Column(name = "CMND")
	private String cmnd;

	@Column(name = "ICON")
	private String icon;


	@Column(name = "TRANGTHAI")
	private Boolean trangThai;

//	@OneToMany(mappedBy = "nvThucHien", fetch = FetchType.LAZY)
//	private Collection<HoaDonEntity> hoadon;
//
//	@OneToMany(mappedBy = "nvTao", fetch = FetchType.LAZY)
//	private Collection<ChiPhiEntity> chiPhi;
	
	
}
