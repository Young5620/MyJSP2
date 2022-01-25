<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String avg = request.getParameter("avg");
	Double re = Double.parseDouble(avg);
	re = (double)Math.round(re*100)/100;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=name %>님 평균 <%=re %>점 합격입니다.</h2>
</body>
</html>