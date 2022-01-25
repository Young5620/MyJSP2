<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML 주석처리 -->
	<h2>주석이 아님</h2>
	<%-- JSP주석처리 페이지 소스에서 안보인다. --%>
	<h2>주석이 아님</h2>
	<%
		//JAVA주석 페이지소스에서 안보인다.
		/*
		여러줄 주석
		*/
	%>
</body>
</html>