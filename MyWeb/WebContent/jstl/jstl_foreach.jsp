<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		//1~100 까지의 합
		int sum = 0;
		for(int i =1;i<=100;i++){
			sum +=i;
		}
	--%>
	<%-- 결과 : <%=sum %><br> --%>
	
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:set var="sum" value="${sum + i }" />
	</c:forEach>
	결과 : ${sum }<br>
	결과 : <c:out value="${sum }" />
	
	<hr>
	<h2>구구단 3단 출력</h2>
	<c:set var="n" value="3" />
	<c:forEach var="i" begin="1" end="9" step="1">
		${n} * ${i} = ${n*i}<br>
	</c:forEach>
	
	<hr>
	<h2>모든 구구단 출력</h2>
	<c:set var="n" value="1" />
	<table border="1">
	<c:forEach var="i" begin="1" end="9" step="1">
		
		<tr>
		<c:forEach var="j" begin="1" end="9" step="1">
		<td>${j} x ${n} = ${n*j}</td>
		</c:forEach>		
		</tr>
		<c:set var="n" value="${i+1}"></c:set>
	</c:forEach>
	</table>
	
	<h2>향상된 for문</h2>
	<%
		int[] arr = {1,2,3,4,5,6};
		for (int a : arr) {
			out.println(a);
	}
	%>
	<br>
	<c:set var="arr2" value="<%=new int[] {1,2,3,4,5,6} %>"/>
	<h3>jstl을 이용한 향상된 for문 출력</h3>
	<c:forEach var="i" items="${arr2}">
		${i}
	</c:forEach>
</body>
</html>