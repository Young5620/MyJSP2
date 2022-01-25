<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	a 태그를 이용하여 경로를 이동 
	1. req_video페이지로 상대경로로 이동설정
	2. req_video페이지로 절대경로로 이동설정
	3. TestServlet으로 상대경로로 이동설정
	4. TestServlet으로 절대경로로 이동설정
	5. request에 img폴더에 있는 이미지를 참조 (img태그 사용 width=100)
	-->
	<a href="../../request/req_video.jsp">req_video페이지 상대경로</a><br>
	<a href="/basicJSP/request/req_video.jsp">req_video페이지 절대경로</a><br>
	<a href="../../apple">TestServlet페이지 상대경로</a><br>
	<a href="/basicJSP/apple">TestServlet페이지 절대경로</a><br>
	<img src="../../request/img/test.jfif" width="100">
</body>
</html>