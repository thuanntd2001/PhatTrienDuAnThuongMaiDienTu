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
@Table(name = "TUKHOA_NHAN")
public class TuKhoa_NhanEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "ID")
	private Long id;

	@OneToMany
	@JoinColumn(name="TUKHOA_ID")
	private TuKhoaEntity tuKhoa;
	
	@OnetoMany
	@JoinColumn(name="NHAN_ID")
	private NhanEntity nhan;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public TuKhoaEntity getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(TuKhoaEntity tuKhoa) {
		this.tuKhoa = tuKhoa;
	}
	
	public NhanEntity getNhan() {
		return nhan;
	}

	public void setNhan(NhanEntity nhan) {
		this.nhan = nhan;
	}

	public TuKhoa_NhanEntity(String id,TuKhoaEntity tuKhoa, NhanEntity nhan) {
		super();
		this.id = id;
		this.tuKhoa = tuKhoa;
		this.nhan = nhan;
	}

	public 	TuKhoa_NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
