<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] arr = request.getCookies();
	String id = null;

	if(arr !=null) { //쿠키가 null이 아닌 경우 실행(존재할 경우)
		/* for(int i=0;i<arr.length;i++){
			if(arr[i].getName().equals("user_id")){
			id = arr[i].getValue();
			}
		} */
		for(Cookie c : arr){
			if(c.getName().equals("user_id")){
				id = c.getValue();
			}
			System.out.println(c.getName());
		}
	}
	else {
		out.println("다시 로그인하세요.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=id%>님 환영합니다~</h2>
</body>
</html>