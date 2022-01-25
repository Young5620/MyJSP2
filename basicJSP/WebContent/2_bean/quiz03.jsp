<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ page import="com.bean.User1" %>
<%
	User1 use = (User1)request.getAttribute("user");
%>

<%=use.getId() %>(<%=use.getName() %>)님 회원가입을 축하합니다.<br>
비밀번호는 <%=use.getPwcheck() %>입니다.
 --%>
<div align="center">
<strong><jsp:useBean id="user" class="com.bean.User1" scope="request" />
<jsp:getProperty property="id" name="user"/>
(<jsp:getProperty property="name" name="user"/>)</strong>님 회원가입을 축하합니다.<br>
비밀번호는 <jsp:getProperty property="pw" name="user"/>입니다.
</div>
</body>
</html>