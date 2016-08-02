package com.forum.pojo;
/**
 * 用户
 * @author student
 *
 */
public class User {
	private int id;
	private String uName;
	private String uPwd;
	private String uPhoto;
	private String gender;
	private int type;
	private String tel;
	private String email;
	private int tNum;
	
	public User(String uName, String uPwd, String uPhoto, String gender, int type, String tel, String email,int tNum) {
		super();
		this.uName = uName;
		this.uPwd = uPwd;
		this.uPhoto = uPhoto;
		this.gender = gender;
		this.type = type;
		this.tel = tel;
		this.email = email;
		this.tNum = tNum;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int id, String uName, String uPwd, String uPhoto, String gender, int type, String tel, String email) {
		super();
		this.id = id;
		this.uName = uName;
		this.uPwd = uPwd;
		this.uPhoto = uPhoto;
		this.gender = gender;
		this.type = type;
		this.tel = tel;
		this.email = email;
	}

	

	@Override
	public String toString() {
		return "User [id=" + id + ", uName=" + uName + ", uPwd=" + uPwd + ", uPhoto=" + uPhoto + ", gender=" + gender
				+ ", type=" + type + ", tel=" + tel + ", email=" + email + ", tNum=" + tNum + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPwd() {
		return uPwd;
	}

	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}

	public String getuPhoto() {
		return uPhoto;
	}

	public void setuPhoto(String uPhoto) {
		this.uPhoto = uPhoto;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int gettNum() {
		return tNum;
	}

	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	
	

}
