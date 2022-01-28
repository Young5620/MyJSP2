<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>
  <body>

	<form action="join_ok" method="post">
		<div align="center">
		 <h2>회원가입 연습</h2>
		<table>
		<tr>
		<td>ID</td>
		<td><input type="text" name="id" size="10"></td>
		</tr>
		<tr>
		<td>PW</td>
		<td><input type="password" name="pw" size="10"></td>
		</tr>
		<tr>
		<td>이름</td>
		<td><input type="text" name="name" size="10"></td>
		</tr>
		<tr>
		<td>전화번호</td>
		<td><select name="phone1">
			<option>010</option>
			<option>011</option>
			<option>018</option>
		</select>
		- <input type="text" name="phone2"></td>
		</tr>
		<tr>
		<td>이메일</td>
		<td><input type="email" name="email" size="30"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td><input type="radio" name="gender" value="M">남자
		<input type="radio" name="gender" value="F">여자</td>
		</tr>
		<tr align="center">
		<td colspan=2><input type="submit" value="가입"></td>
		</tr>
		</table>
		</div>
		</form>
  </body>
</html>