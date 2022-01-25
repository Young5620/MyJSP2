<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Cookie[] arr = request.getCookies();
	String date = null;

	if(arr !=null) { //쿠키가 null이 아닌 경우 실행(존재할 경우)
		for(int i=0;i<arr.length;i++){
			if(arr[i].getName().equals("show")){
			date = arr[i].getValue();
			}
		}
	}
	else {
		out.println("쿠키가 없습니다.");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(date==null){%>
쿠키값이 없습니다.		
<% } else{%>
마지막 접속날짜 : <%=date%>
<%} %>
</body>
</html>