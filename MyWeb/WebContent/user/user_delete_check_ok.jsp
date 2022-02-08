<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. user_delete_check로 받은 폼데이터 값 처리
	2. login(id,pw) 메서드를 재사용하여, 비밀번호를 확인
	3. login메서드가 0을 반환하면 "비밀번호를 확인하세요"라고 출력
	4. login메서드가 1을 반환하면 delete메서드를 실행
	5. 삭제 성공시 "회원탈퇴가 처리되었습니다." 출력. 세션을 전부삭제 후 MyWeb으로 이동
	6. 삭제 실패시 "회원탈퇴에 실패했습니다." 출력. 마이페이지로 이동
	*/
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("user_id")==null) {
		response.sendRedirect("user_login.jsp");
	}
	
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id, pw);
	
	if(result==0) { //비밀번호가 틀린 경우
%>
	<script>
		alert("비밀번호를 확인하세요");
		location.href="user_mypage.jsp";
	</script>
<%
	} else { //비밀번호가 맞은 경우
		int result1 = dao.Delete(id);
	
		if(result1==1) {
			session.invalidate();
%>
			<script>
				alert("회원탈퇴가 처리되었습니다.");
				location.href="/MyWeb";
			</script>
<%		} else {
%>
			<script>
				alret("회원탈퇴에 실패했습니다.");
				location.href="user_mypage.jsp";
			</script>
<%				
		}
	}
%>   