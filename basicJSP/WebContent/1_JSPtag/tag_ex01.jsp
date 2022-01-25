<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//선언자와 스크립트릿의 차이 => 멤버변수는 전역변수의 성질을 가지면서 전체어플에 영향을 준다.
	int total = 0; //누적페이지수 변수 선언
	public int randomNum() {
	Random ran = new Random();
	int num = ran.nextInt(100);
	return num;
}
%> 
    
<%
	/*
		선언자, 스크립틀, 지시자, 표현식 사용하는 예제
		1. 페이지를 접속할 때 마다 랜덤으로 생성된 값을 출력(메서드사용) : 
		출력양식-> 오늘의 숫자 : 랜덤숫자를 출력
		2. 페이지 누적요청 숫자를 계산하여 출력
		출력양식-> 페이지 누적요청 : 누적요청수(int)
		3. 요청한 페이지 개별요청 숫자를 표시
		출력양식-> 페이지 개별요청 : 개별요청수
	*/
	//페이지가 실행될 때 마다 발생하는 코드를 작성
	int each = 0;
	total++;
	each++;
	int rn = randomNum(); //0~999사이에 있는 랜덤값 출력
%>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
페이지 누적요청 : <%= total %><br>
페이지 개별요청 : <%= each %><br>
오늘의 숫자 : <%= rn %><br>
</p>

</body>
</html>