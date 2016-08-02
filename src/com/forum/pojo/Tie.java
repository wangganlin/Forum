package com.forum.pojo;
/**
 * Ьћзг
 * @author student
 *
 */
public class Tie {
	private int id;
	private String tTitle;
	private String tDate;
	private String tType;
	private String tStyle;
	private String tContent;
	private String tUsername;

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	public Tie() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tie(int id, String tTitle, String tDate, String tType, String tStyle, String tContent, String tUsername) {
		super();
		this.id = id;
		this.tTitle = tTitle;
		this.tDate = tDate;
		this.tType = tType;
		this.tStyle = tStyle;
		this.tContent = tContent;
		this.tUsername = tUsername;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String gettTitle() {
		return tTitle;
	}

	public void settTitle(String tTitle) {
		this.tTitle = tTitle;
	}

	public String gettDate() {
		return tDate;
	}

	public void settDate(String tDate) {
		this.tDate = tDate;
	}

	public String gettType() {
		return tType;
	}

	public void settType(String tType) {
		this.tType = tType;
	}

	public String gettStyle() {
		return tStyle;
	}

	public void settStyle(String tStyle) {
		this.tStyle = tStyle;
	}

	public String gettContent() {
		return tContent;
	}

	public void settContent(String tContent) {
		this.tContent = tContent;
	}

	public String gettUsername() {
		return tUsername;
	}

	public void settUsername(String tUsername) {
		this.tUsername = tUsername;
	}

}
