package springboot.dto;

//@Entity
//@Table(name = "TUKHOA_NHAN")
public class TuKhoa_NhanEntity {
	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//@Column(name = "ID")
	private Long id;

	//@ManyToOne
	//@JoinColumn(name = "TENTUKHOA")
	private String tuKhoa;
	
	//@ManyToOne
	//@JoinColumn(name = "TENNHAN")
	private String nhan;

	



	public String getNhan() {
		return nhan;
	}


	public void setNhan(String nhan) {
		this.nhan = nhan;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTuKhoa() {
		return tuKhoa;
	}


	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}




	public 	TuKhoa_NhanEntity() {
		super();
		// TODO Auto-generated constructor stub
	}


}
