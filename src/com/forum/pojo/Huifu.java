package com.forum.pojo;
/**
 * 回复
 * @author student
 *
 */
public class Huifu {
	private int id;
	private String hDate;
	private String hContent;
	private String cUsername;
	private String hUersname;
	private int hcomId;

	public Huifu() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	@Override
	public String toString() {
		return "Huifu [id=" + id + ", hDate=" + hDate + ", hContent=" + hContent + ", cUsername=" + cUsername
				+ ", hUersname=" + hUersname + ", hcomId=" + hcomId + "]";
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String gethDate() {
		return hDate;
	}

	public void sethDate(String hDate) {
		this.hDate = hDate;
	}

	public String gethContent() {
		return hContent;
	}

	public void sethContent(String hContent) {
		this.hContent = hContent;
	}

	
	public String getcUsername() {
		return cUsername;
	}



	public void setcUsername(String cUsername) {
		this.cUsername = cUsername;
	}



	public String gethUersname() {
		return hUersname;
	}

	public void sethUersname(String hUersname) {
		this.hUersname = hUersname;
	}

	public int getHcomId() {
		return hcomId;
	}

	public void setHcomId(int hcomId) {
		this.hcomId = hcomId;
	}

}
