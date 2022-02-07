<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("user_id")==null) {
		response.sendRedirect("user_login.jsp");
	}
	
	String id = (String)session.getAttribute("user_id");
	
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.Delete(id);
	
	if(result==1) {
	session.invalidate();
%>
	<script>
		alert("회원탈퇴에 성공했습니다.");
		location.href="user_login.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alret("회원탈퇴에 실패했습니다.");
		location.href="user_mypage.jsp";
	</script>
<%				
	}
%>   