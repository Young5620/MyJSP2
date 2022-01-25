<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- form태그를 이용하여 입력값을 받는 JSP -->
<h2>이름과 점수를 입력하세요</h2>
<form action="score_quiz02.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	국어 : <input type="text" name="ko"><br>
	영어 : <input type="text" name="en"><br>
	수학 : <input type="text" name="math"><br>
	<input type="submit" value="제출">
</form>
</body>
</html>