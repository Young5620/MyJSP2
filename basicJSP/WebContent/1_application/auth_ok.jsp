<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	/* 
	1. 앞페이지에서 사용자가 입력한 값과 arr[1]값을 비교
		기억)arr[1]은 세션에 저장
	2. 두값이 일치한다면, reserve.jsp로 리다이렉트
	3. 두값이 일치하지 않으면, auth.jsp로 다이렉트
	*/
	
	String code = request.getParameter("code");
	String auth = (String)session.getAttribute("auth");
	
	if(code.equals(auth)){
		//인증성공
		response.sendRedirect("reserve.jsp");
	}else{
		response.sendRedirect("auth.jsp");
	}

%>
