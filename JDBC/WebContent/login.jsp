<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn{
	width: 60px;
	height: 80px;
	background-color: skyblue;
}
</style>
</head>
<body>
	<h2>로그인연습</h2>
	<form action="login_ok" method="post">
	<table>
	<tr>
	<td>아이디</td>
	<td><input type="text" name="id" size="10"></td>
	<td rowspan=3><input type="submit" value="로그인" class="btn"></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pw" size="10"></td>
	</tr>
	<tr>
	<td></td>
	</tr>
	</table>
	</form>
</body>
</html>