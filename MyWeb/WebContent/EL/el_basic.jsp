<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>표현식</h3>
	<%=1+2 %><br>
	<%="안녕" %><br>
	<%=1>2 || 1==2  %><br>
	------------------<br>
	<h3>EL</h3>
	<h4>산술연산</h4>
	${1+2}<br>
	${"안녕"}<br>
	
	<h4>비교/논리 연산</h4>
	${1>2}<br>
	${1<2}<br>
	<hr>
	${1<2 && 1!=2}<br>
	${1<2 and 1>2}<br>
	<hr>
	${1>2 or 1>2 }<br>
	${1>2 || 1>2 }<br>
	<hr>
	${'홍길동' == '홍길동'}<br>
	${'홍길동' eq '홍길동'}<br>
	<hr>
	${'홍길동' != '홍길동'}<br>
<%--${'홍길동' ne '홍길동'}<br> --%>
	
	<h4>삼항연산</h4>
	${1==2 ? "같음(참)" : "다름(false)" }<br>
	${1<2 ? "같음(참)" : "다름(false)" }<br>
</body>
</html>