<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>
  <body>
    <h2>자바코드를 이용한 bean을 사용</h2>
    <%@ page import="com.bean.User"%>
    <%
    	User user = (User)request.getAttribute("user");
    %>
    전달받은 아이디 : <%=user.getId() %><br>
    전달받은 이름 : <%=user.getName() %><br>
  </body>
</html>