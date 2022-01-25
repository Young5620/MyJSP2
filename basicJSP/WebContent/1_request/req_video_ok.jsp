<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	Integer sel = Integer.parseInt(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(num==null) {
	%>
	잘못된 접근입니다.
	<%
	} else if(sel==1){
	%>
	<div align="center">
	<h2>시스코 네트워크</h2>
	<p>1. vtp 예제</p>
	<hr>
	<iframe width="576" height="360" src="https://www.youtube.com/embed/7jApbSAFMMI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<!-- 영상 실행후 소스복사 -->
	</div>
	<%}else if(sel==2){
	%>
	<div align="center">
	<h2>시스코 네트워크</h2>
	<p>2. stp 예제</p>
	<hr>
	<iframe width="868" height="488" src="https://www.youtube.com/embed/SBy_FHatcRk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<!-- 영상 실행후 소스복사 -->
	</div>
	<%
	}
	%>
</body>
</html>