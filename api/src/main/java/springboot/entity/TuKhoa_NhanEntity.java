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
@Table(name = "TUKHOA_NHAN")
public class TuKhoa_NhanEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "TENTUKHOA")
	private TuKhoaEntity tuKhoa;
	
	@ManyToOne
	@JoinColumn(name = "TENNHAN")
	private NhanEntity nhan;

	



	public NhanEntity getNhan() {
		return nhan;
	}


	public void setNhan(NhanEntity nhan) {
		this.nhan = nhan;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public TuKhoaEntity getTuKhoa() {
		return tuKhoa;
	}


	public void setTuKhoa(TuKhoaEntity tuKhoa) {
		this.tuKhoa = tuKhoa;
	}




	public 	TuKhoa_NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
