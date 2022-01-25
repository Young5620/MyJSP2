<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- ID,PW,Name을 입력받아서 처리하는 부분 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h2>회원가입</h2>
	<form action="quiz02.jsp" method="post">
	<table>
	<tr>
	<td>아이디 </td>
	<td><input type="text" name="id" size="10"></td>
	</tr>
	<tr>
	<td>비밀번호 </td>
	<td><input type="password" name="pw" size="10"></td>
	</tr>
	<tr>
	<td>비밀번호 확인 </td>
	<td><input type="password" name="pwcheck" size="10"></td>
	</tr>
	<tr>
	<td>이름 </td>
	<td><input type="text" name="name" size="10"></td>
	</tr>
	<tr>
	<td><input type="submit" value="회원가입"></td>
	</tr>
	</table>
	</form>
	</div>
</body>
</html>