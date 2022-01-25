<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>액션태그를 이용한 bean을 사용</h2>
 <jsp:useBean id="user" class="com.bean.User" scope="request" />
 액션태그로 받아온 아이디 : <jsp:getProperty property="id" name="user"/><br>
 액션태그로 받아온 이름 : <jsp:getProperty property="name" name="user"/><br>
</body>
</html>