<%@page import="com.myweb.user.model.UserVO"%>
<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼값 받기
	2. DAO연동을 통해서 update()메서드를 호출해서 회원정보를 수정
	3. 매개값을 VO로 전달
	4. 수정 성공시 "회원정보가 수정되었습니다." 출력후 마이페이지 이동
		수정 실패시 "회원정보 수정에 실패했습니다." 출력후 마이페이지 이동
	*/
	if(session.getAttribute("user_id")==null) {
		response.sendRedirect("user_login.jsp");
	}

	String id = (String)session.getAttribute("user_id");
	
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO(id,null,name,email,address,null);
	
	int result = dao.Update(vo);
	
	if(result==1) {//정보수정 성공 
		//이름이 변경되었다면 세션에 저장되어있던 이름을 변경해줘야한다.
		session.setAttribute("user_name", vo.getName());
%>
		<script>
			alert("회원정보가 수정되었습니다.");
			location.href="user_mypage.jsp";
		</script>
<%	} else { //정보수정 실패 
%>
		<script>
			alert("회원정보 수정에 실패했습니다.");
			location.href="user_mypage.jsp";
		</script>		
<%	}
%>    
