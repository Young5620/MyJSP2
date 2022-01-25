
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	cookie01.jsp는 웹페이지에 접근한 시간을 xxxx년 xx월 xx일 형태로 쿠키를 생성
	날짜 형식을 문자열 형태로 show라는 이름의 쿠키로 생성
	
	cookie02.jsp는 cookie01.jsp에서 생성된 쿠키를 확인하는 페이지
	show쿠키가 있다면, 쿠키를 가지고 있는 값을 화면에 출력,
	만약 없다면 ,"쿠키가 없습니다."를 출력
	*/
	
	Date now = new Date();
	SimpleDateFormat date = new SimpleDateFormat("hh:mm:ss");
	
	Cookie show = new Cookie("show",date.format(now));
	show.setMaxAge(30);
	
	response.addCookie(show);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="cookie02.jsp">쿠키확인하기</a>
</body>
</html>