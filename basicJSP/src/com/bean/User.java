package com.bean;

public class User {
	
	//변수선언
	private String id;
	private String pw;
	private String name;
	private String email;
	
	/*
	 자바빈 클래스는 form값과 데이터베이스의 통신과정에서 변수처리를 쉽게하기 위해서 사용하는 클래스
	 변수선언 및 getter, setter를 반드시 생성해야한다. 
	 */
	
	 //생성자는 기본생성자와 모든 멤버변수를 초기화하는 생성자 2개를 생성
	
	public User() {
		
	}

	public User(String id, String pw, String name, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
