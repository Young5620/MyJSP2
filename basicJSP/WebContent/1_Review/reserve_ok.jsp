<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = new ArrayList<>();
	List<String> temp = new ArrayList<>();
	
	if(application.getAttribute("seat") != null) {
		list = (List<String>)application.getAttribute("seat");
	}
	
	String[] arr = request.getParameterValues("seat");
	
	for(String s : arr){
		if(list.contains(s)){
			break;
		}
		else{
			temp.add(s);
		}
	}
	
	if(arr.length == temp.size()){
		list.addAll(temp);
	}
	
	application.setAttribute("seat", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 신청결과</title>
</head>
<body>
	<div align="center">
	<h2>예약 신청결과</h2>
	<p>
		<b>선택한 좌석</b><br>
		<%for(String s : arr){%>
			[<%=s %>]
		<%}%><br><br>
		<b>예약 신청결과</b> : 
		<%=arr.length == temp.size() ? "성공":"실패" %>
		<br>
		<%if(arr.length != temp.size()){%>
		이미 예약된 좌석입니다.
		<%}%>
	</p>
	<a href="reserve.jsp">다시 예약하기</a>
	</div>
</body>
</html>