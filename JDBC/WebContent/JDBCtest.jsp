<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	/*
	=driver=
	MySQL(6이후): com.mysql.cj.jdbc.Driver
	MySQL(6이전): com.mysql.jbbc.Driver
	Mariadb: org.mariadb.jdbc.Driver
	
	=url=
	오라클 : jdbc:oracle:thin:@[서버주소(IP 또는 도메인)]:[서비스포트(1521)]/[세션 or 계정]
	MySQL(6이후) : jdbc:mysql://[서버주소]:[서비스포트(3306)]/[DB이름]/?serverTimezone=UTC
	MySQL(6이전) : jdbc:mysql://[서버주소]:[서비스포트(3306)]/[DB이름]
	서울의 UTC : Asia/Seoul
	MariaDB : jdbc:mysql://[서버주소]:[서비스포트(3306)]/[DB이름]
	*/
	String user = "hr";
	String password = "hr";
	
	Connection con = null;
	Boolean connect = false;
	
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		connect = true;
		
	} catch(ClassNotFoundException cnfe) {
		System.out.println("드라이버 로딩 실패 : " + cnfe.toString());
		connect = false;
	} catch(SQLException sqle) {
		System.out.println("DB 연결 실패 : " + sqle.toString());
		connect = false;
	} catch(Exception e) {
		System.out.println("알 수 없는 에러");
		connect = false;
		e.printStackTrace();
	}
	%>
	<%if(connect) {%>
	<h2>DB 연동 성공</h2>
	<%}else{%>
	<h2>DB 연동 실패</h2>
	<%} %>
</body>
</html>