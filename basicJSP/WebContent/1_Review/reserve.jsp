<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = new ArrayList<>();
	if(application.getAttribute("seat") !=null){
		list = (List<String>)application.getAttribute("seat");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>콘서트 예약</h2>
<h4>예약할 좌석을 선택하세요</h4>
<hr>
<form action="reserve_ok.jsp">
<b>좌석배치도</b><br>
<table>
<tr>
<td><%=(char)0 %></td>
<%for(int i=0;i<26;i++){%>
	<td><%=(char)(i+65) %></td>
<%} %>
</tr>

<%for(int j=1;j<=3;j++){%>
<tr>
 <td> <%=j %></td>
  <%for(int k=0;k<26;k++){%>
  <%if(list.contains(j+"-"+(char)(k+65))){%>
 <td><input type="checkbox" name="seat" value="<%=j %>-<%=(char)(k+65) %>" disabled></td>
  <%}else{%>
  
 <td><input type="checkbox" name="seat" value="<%=j %>-<%=(char)(k+65) %>"></td>
  <%} %>
  <%}%>
</tr>
<%}%>

<tr>
 <td></td>
  <%for(int k=0;k<26;k++){%>
 <td></td>
  <%}%>
</tr>
<tr>
 <td></td>
  <%for(int k=0;k<26;k++){%>
 <td></td>
  <%}%>
</tr>
<tr>
 <td></td>
  <%for(int k=0;k<26;k++){%>
 <td></td>
  <%}%>
</tr>
  
<%for(int x=4;x<=6;x++){%>
<tr>
 <td> <%=x %></td>
  <%for(int k=0;k<26;k++){%>
  <%if(list.contains(x+"-"+(char)(k+65))){%>
 <td><input type="checkbox" name="seat" value="<%=x %>-<%=(char)(k+65) %>" disabled></td>
  <%}else{%>
  
 <td><input type="checkbox" name="seat" value="<%=x%>-<%=(char)(k+65) %>"></td>
  <%} %>
  <%}%>
</tr>
<%}%>

</table><br>
<input type="submit" value="예약">
<input type="reset" value="취소">
</form>
</div>
</body>
</html>