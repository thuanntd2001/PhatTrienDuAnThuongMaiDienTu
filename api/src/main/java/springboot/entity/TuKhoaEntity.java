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
@Table(name = "TUKHOA")
public class TuKhoaEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "ID")
	private Long id;
	
	@Column(name="TENTUKHOA")
	private String tenTuKhoa;
	
	@ManyToOne(mappedBy="TUKHOA", fetch=FetchType.LAZY)
	private Collection<TuKhoa_NhanEntity> tuKhoa_Nhan;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenTuKhoa() {
		return tenTuKhoa;
	}

	public void setTenTuKhoa(String tenTuKhoa) {
		this.tenTuKhoa = tenTuKhoa;
	}
	
	public Collection<TuKhoa_NhanEntity> getTuKhoa_Nhan() {
		return tuKhoa_Nhan;
	}

	public void setTuKhoa_Nhan(Collection<TuKhoa_NhanEntity> tuKhoa_Nhan) {
		this.tuKhoa_Nhan = tuKhoa_Nhan;
	}


	public TuKhoaEntity(String id, Collection<TuKhoa_NhanEntity> tuKhoa_Nhan, String tenTuKhoa) {
		super();
		this.id = id;
		this.tuKhoa_Nhan = tuKhoa_Nhan;
		this.tenTuKhoa = tenTuKhoa;
	}

	public TuKhoaEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
