<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	int total = 0;
	
	public int randomNum() {
		Random ran = new Random();
		int num = ran.nextInt(8)+2; //2~9사이 정수
		return num;
	}
	
	
%>

<%-- 페이지 누적요청 및 랜덤값을 출력, 매 10번째 방문자에게는 기프트콘을 드립니다. 
	 10번째 마다 "당첨되었습니다." 가 출력되게 해보세요.
	 scriptlet은 <body>태그에서 작성하세요
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<%
	total++;
	int ran = randomNum();
%>
페이지 누적요청수 : <%= total %> <br>
매 10번째 방문자에게는 기프티콘을 드립니다.<br>
<%
	if(total%10==0) {
	%>
		당첨되었습니다.
		<%
	}
%>
</p>
<br>
랜덤값 : <%= ran %>
<h2>랜덤 구구단 <%=ran %>단 입니다.</h2>
<%
	for(int i=1;i<=9;i++){
		int re = ran*i;
		%>
		<%=ran %> x <%=i %> = <%=re %><br>
		<%
	}
%>
</body>
</html>