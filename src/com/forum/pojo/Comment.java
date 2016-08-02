package com.forum.pojo;
/**
 * 
 * ÆÀÂÛ
 * @author student
 *
 */
public class Comment {
	private int id;
	private String cDate;
	private String cContent;
	private String cUsername;
	private int tieId;

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int id, String cDate, String cContent, String cUsername, int tieId) {
		super();
		this.id = id;
		this.cDate = cDate;
		this.cContent = cContent;
		this.cUsername = cUsername;
		this.tieId = tieId;
	}

	

	@Override
	public String toString() {
		return "Comment [id=" + id + ", cDate=" + cDate + ", cContent=" + cContent + ", cUsername=" + cUsername
				+ ", tieId=" + tieId + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcUsername() {
		return cUsername;
	}

	public void setcUsername(String cUsername) {
		this.cUsername = cUsername;
	}

	public int getTieId() {
		return tieId;
	}

	public void setTieId(int tieId) {
		this.tieId = tieId;
	}

}
