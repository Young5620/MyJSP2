<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");	
	double hei = Double.parseDouble(request.getParameter("height"));
	double wei = Double.parseDouble(request.getParameter("weight"));
	double bmi = wei/(hei/100*hei/100);
	bmi = (int)(bmi * 100) / 100.0; // 연산을 통해 자리수를 잘라내는 방식
		
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI측정 결과</title>
</head>
<body>
	이름 : <%=name %><br>
	키 : <%=hei %> cm<br>
	몸무게 : <%=wei %> kg<br>
	BMI지수 : <%=bmi %><br>
	당신은 
	<% 
	if(bmi>=25){
	%>
	과체중
	<%
	}else if(bmi<=18){
	%>
	저체중
	<%
	}else{
	%>
	정상
	<%
	}
	%>입니다.
</body>
</html>