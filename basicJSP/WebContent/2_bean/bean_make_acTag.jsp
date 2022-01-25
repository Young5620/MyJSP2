<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2>액션태그로 자바빈 사용</h2>
	<jsp:useBean id="user" class="com.bean.User" scope="request" />
	<jsp:setProperty property="id" name="user" value="kkk123" />
	<jsp:setProperty property="name" name="user" value="홍길동3" />
	<jsp:forward page="bean_use_acTag.jsp" />
</body>
</html>