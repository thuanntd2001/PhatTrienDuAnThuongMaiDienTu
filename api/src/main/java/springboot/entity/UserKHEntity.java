package springboot.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="USERKH")
public class UserKHEntity {
	@Id
	@Column(name="USERNAME")
	private String userName;
	
	@ManyToOne
	@JoinColumn(name="MAKH")
	private KhachHangEntity userkh;
	
	@Column(name="PASSWD")
	private String passwd;
	
	
	@ManyToOne
	@JoinColumn(name="ROLEID")
	private ChucVuEntity chucVu;
	
	@Column(name="STATUS")
	private Integer status;
	
	@Column(name ="EMAIL")
	private String email;
	
	@Column(name="ICON")
	private String icon;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public KhachHangEntity getUserkh() {
		return userkh;
	}

	public void setUsernv(KhachHangEntity userkh) {
		this.userkh = userkh;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public ChucVuEntity getChucVu() {
		return chucVu;
	}

	public void setChucVu(ChucVuEntity chucVu) {
		this.chucVu = chucVu;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public UserKHEntity(String userName, KhachHangEntity userkh, String passwd, ChucVuEntity chucVu, Integer status,
			String email, String icon) {
		super();
		this.userName = userName;
		this.userkh = userkh;
		this.passwd = passwd;
		this.chucVu = chucVu;
		this.status = status;
		this.email = email;
		this.icon = icon;
	}

	public UserKHEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
