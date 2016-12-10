package DTO;

public class User_DTO {
	int userid;
	String userName;
	String password;
	String email;
	String fullname;
	String SigninDate;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getSigninDate() {
		return SigninDate;
	}
	public void setSigninDate(String signinDate) {
		SigninDate = signinDate;
	}
	
	public User_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User_DTO(String userName, String password, String email) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
	}
	@Override
	public String toString() {
		return "User_DTO [userid=" + userid + ", userName=" + userName
				+ ", password=" + password + ", email=" + email + ", fullname="
				+ fullname + ", SigninDate=" + SigninDate + "]";
	}
	
	
}
