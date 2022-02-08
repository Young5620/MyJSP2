<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//form태그 값을 처리
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	/*
	1. login(id,pw) 메서드를 생성
	   executeQurey()메서드를 사용하고 그 결과값이 존재하는지 확인
	2. 결과값이 존재하면 성공의 의미로 1을 반환
	     결과값이 없다면 실패의 의미로 0을 반환
	3. 실패인경우 경고창을 출력 후 뒤로가기
	     성공인 경우 user_mypage.jsp로 이동
	4. 성공시 user_mapage.jsp로 이동하기 전에 user_mypage.jsp에 전달할 정보를 
	     세션에 저장하여 전달(UserVO객체에 정보를 저장)
	5. UserDAO에 getUserInfo(id) 메서드 생성 - id에 속한 정보를 저장하는 메서드 ->UserVO형태로 반환
	*/
	
	UserDAO dao = UserDAO.getInstance();
	
	int result = dao.login(id, pw);
	
	if(result==1) {
		//로그인 성공
		UserVO vo = dao.getUserInfo(id);
		
		//아이디와 이름을 세션에 저장
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", vo.getName());
		
		response.sendRedirect("user_mypage.jsp");
%>
<%		
	} else {
	//로그인 실패
%>
		<script>
			alert("아이디 또는 비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
<%  }
%>