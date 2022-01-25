<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	//checkbox는 getParameterValues() 를 사용하여 처리함
	String[] arr = request.getParameterValues("intro");
	String major = request.getParameter("major");
	String phone = request.getParameter("phone");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id%><br>
	비밀번호 : <%=pw%><br>
	이름 : <%=name%><br>
	주소 : <%=address%><br>
	관심분야 : <%=Arrays.toString(arr) %> <!-- 배열의 처리 -->
	<%-- <%
		out.print("[");
	for(int i=0;i<arr.length;i++) {
		out.print(arr[i]+" ");
	}
		out.print("]");
	%> --%><br>
	전공 : <%=major%><br>
	통신사 : <%=phone%><br>
	
</body>
</html>