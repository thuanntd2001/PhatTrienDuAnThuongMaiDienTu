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
@Table(name = "NHAN")
public class NhanEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "ID")
	private Long id;
	
	@Column(name="TENNHAN")
	private String tenNhan;
	
	@ManyToOne(mappedBy="NHAN", fetch=FetchType.LAZY)
	private Collection<TuKhoa_NhanEntity> tuKhoa_Nhan;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenNhan() {
		return tenNhan;
	}

	public void setTenNhan(String tenNhan) {
		this.nhan = tenNhan;
	}
	
	public Collection<TuKhoa_NhanEntity> getTuKhoa_Nhan() {
		return tuKhoa_Nhan;
	}

	public void setTuKhoa_Nhan(Collection<TuKhoa_NhanEntity> tuKhoa_Nhan) {
		this.tuKhoa_Nhan = tuKhoa_Nhan;
	}


	public NhanEntity(String id, Collection<TuKhoa_NhanEntity> tuKhoa_Nhan, String tenNhan) {
		super();
		this.id = id;
		this.tuKhoa_Nhan = tuKhoa_Nhan;
		this.tenNhan = tenNhan;
	}

	public NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
