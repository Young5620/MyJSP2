package com.bean;

public class User1 {
	private String id;
	private String pw;
	private String pwcheck;
	private String name;
	
	public User1() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User1(String id, String pw, String pwcheck, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.pwcheck = pwcheck;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPwcheck() {
		return pwcheck;
	}

	public void setPwcheck(String pwcheck) {
		this.pwcheck = pwcheck;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
