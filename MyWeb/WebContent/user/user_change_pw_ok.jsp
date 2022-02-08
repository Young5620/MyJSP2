<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	1. 폼값 처리
	2. login(id,예전 비밀번호) 아이디로 비밀번호가 맞는지 확인
		예전 비밀번호가 틀리면 뒤로가기
	3. 일치하면 changePassword(??)를 실행
	4. 성공하면 "비밀번호 변경처리 되었습니다." 출력하고 mypage이동
	5. 실패하면 "비밀번호 변경에 실패했습니다." 출력하고 mypage이동
	*/
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("user_id")==null){
		response.sendRedirect("user_login.jsp");
	}
	String id = (String)session.getAttribute("user_id");
	String oldpw = request.getParameter("old_pw");
	String newpw = request.getParameter("new_pw");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO();
	
	int result = dao.login(id, oldpw);
	
	if(result==1) {
		//비밀번호 변경 실행
		int result2 = dao.changePassword(id, newpw);%>
		<%if(result2==1) {%>
			<script>
				alert("비밀번호 변경처리 되었습니다.");
				location.href="user_mypage.jsp";
			</script>	
		<%}else{%>
			<script>
				alert("비밀번호 변경에 실패했습니다.");
				location.href="user_mypage.jsp";
			</script>
		<%}%>
	<%}else {//예전 비밀번호 입력 실패%>
		<script>
			alert("비밀번호 변경에 실패했습니다. 다시 입력해주세요");
			history.go(-1);
		</script>
	<%}%>