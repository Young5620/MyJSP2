<%@page import="com.ok.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id는 세션을 통해서 얻고, 회원정보는 request객체를 통해서 얻음
	String id = (String)session.getAttribute("user_id");
	/* String pw = (String)request.getAttribute("user_pw");
	String name = (String)request.getAttribute("user_name");
	String phone1 = (String)request.getAttribute("user_phone1");
	String phone2 = (String)request.getAttribute("user_phone2");
	String email = (String)request.getAttribute("user_email");
	String gender = (String)request.getAttribute("user_gender"); */
	
	//vo를 이용한 값 받기
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	
	String pw = vo.getPw();
	String name = vo.getName();
	String phone1 = vo.getPhone1();
	String phone2 = vo.getPhone2();
	String email = vo.getEmail();
	String gender = vo.getGender();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<!-- 
	input태그의 읽기 전용은 readonly
	select 태그의 옵션 중 미리 선택(default)값은 "selected"
	radio 버튼이나, checkbox미리 선택하는 기능은 "checked"
	radio 버튼이나, checkbox선택할 수 없게 하는 기능은 "disabled"
 -->

	<form action="update_ok" method="post">
		<div align="center">
		<h2>회원정보수정 연습</h2>
		<table>
		<tr>
		<td>ID</td>
		<td><input type="text" name="id" size="10" value="<%=id %>" readonly></td>
		</tr>
		<tr>
		<td>PW</td>
		<td><input type="password" name="pw" size="10" value="<%=pw %>" readonly></td>
		</tr>
		<tr>
		<td>이름</td>
		<td><input type="text" name="name" size="10" value="<%=name %>"></td>
		</tr>
		<tr>
		<td>전화번호</td>
		<td><select name="phone1" >
			<option <%=phone1.equals("010") ? "selected":"" %>>010</option>
			<option <%=phone1.equals("011") ? "selected":"" %>>011</option>
			<option <%=phone1.equals("018") ? "selected":"" %>>018</option>
		</select>
		-<input type="text" name="phone2" value="<%=phone2 %>"></td>
		</tr>
		<tr>
		<td>이메일 </td>
		<td><input type="email" name="email" size="30" value="<%=email %>"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td><%if(gender ==null ||gender.equals("M")) {%>
		<input type="radio" name="gender" value="M" checked>남자
		<input type="radio" name="gender" value="F">여자
		<%}else{ %>
		<input type="radio" name="gender" value="M">남자
		<input type="radio" name="gender" value="F" checked>여자
		<%} %></td>
		</tr>
		<tr>
		<td colspan=2 align="center"><input type="submit" value="수정"></td>
		</tr>
		</table>
		</div>
		</form>
</body>
</html>