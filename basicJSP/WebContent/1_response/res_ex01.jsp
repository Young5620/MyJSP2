<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	나이를 입력 받아서 성인여부를 확인하는 내용을 출력하는 예제
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>res_ex01</h2>
	<form action="res_ex01_result.jsp">
		나이 : <input type="text" name="age" placeholder="나이를 입력하세요">
		<input type="submit" value="확인">
	</form>
</body>
</html>