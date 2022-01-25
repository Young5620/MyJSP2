<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		width: 257px;
		margin: 0 auto;
		text-align: center;
	}
	.btn {
		width: 60px;
		height: 50px;
		background-color: purple;
	}
</style>
<!-- style에서 클래스 선택자 ".", "#"은 id 선택자로 사용 -->
<!-- 
	CSS를 사용하는 대표적인 방법 
	1. 태그 속성에 직접 선언하여 사용하는 방법
	2. head태그 내에 style태그를 사용하여 CSS선언하여 사용
	3. 외부 파일을 만들어 링크를 불러와서 사용
	-->
</head>
<body>
	<div class="wrap">
	<h2>리다이렉트 로그인 연습</h2>
	<hr>
	<form action="res_login_ok.jsp" method="post">
	<table border="1">
	<tr>
		<td><input type="text" name="id" placeholder="아이디"></td>
		<td rowspan=2><input type="submit" value="로그인" class="btn"></td>
	</tr>
	<tr>
		<td><input type="password" name="pw" placeholder="비밀번호"></td>
	</tr>
	</table>
	</form>
	</div>
</body>
</html>