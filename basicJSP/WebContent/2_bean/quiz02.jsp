<%@page import="com.bean.User1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 전달받은 값을 처리
	 2. pw와 pw체크값이 같으면 User객체에 quiz01로부터 받은 값을 저장하여 quiz03으로 전달
	 	quiz03 출력내용
	 	"id(name)님의 회원가입을 축하합니다. 비밀번호가 ****입니다."	
	 3. pw와 pw체크값이 다르면 quiz04로 넘어가서 "회원가입에 실패했습니다."출력
	  -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwcheck = request.getParameter("pwcheck");
	String name = request.getParameter("name");
	
	/* 	
	if(pw.equals(pwcheck)){
		User1 use = new User1();
		use.setId(id);
		use.setPw(pw);
		use.setName(name);
		request.setAttribute("user", use);
		RequestDispatcher dp = request.getRequestDispatcher("quiz03.jsp");
		dp.forward(request, response);
	}else{
		response.sendRedirect("quiz04.jsp");
	} */
%>
<%if(pw.equals(pwcheck)){%>
<jsp:useBean id="user" class="com.bean.User1" scope="request" />
<jsp:setProperty property="id" name="user" value="<%=id %>"/>
<jsp:setProperty property="pw" name="user" value="<%=pw %>"/>
<jsp:setProperty property="name" name="user" value="<%=name %>"/>
<jsp:forward page="quiz03.jsp" />
<%}else{
	response.sendRedirect("quiz04.jsp");
}
%>
   


