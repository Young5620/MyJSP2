<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 측정 프로그램</title>
</head>
<body>
	<!-- 
	1. form태그를 이용하여 post형식으로 이름, 키와 몸무게를 입력 받음
	2. req_quiz_result.jsp로 입력값을 전달
	3. 전달된 페이지(req_quiz_result.jsp)에서는 넘어간 값을 처리
		BMI지수를 처리
	4. BMI공식 = kg / (cm/100*cm/100)
		->String형식의 값으로 전달됨 때문에 Integer.parseInt(값) 을 사용
		또는 Double.parseDouble(값)을 사용
		화면에 이름, 키, 몸무게, BMI지수를 출력
	5. if를 통해서 BMI지수가 25이상 과체중, 18이하면 저체중, 나머지는 정상
	 -->
	 <h2>BMI 측정 프로그램</h2>
	 <form action="req_quiz01_result.jsp" method="post">
	 <table border="1">
	 <tr>
	 <td>이름</td>
	 <td><input type="text" size="10" name="name"></td>
	 <td rowspan=3><input type="submit" value="입력"></td>
	 </tr>
	 <tr>
	 <td>키</td>
	 <td><input type="text" size="5" name="height">(cm)</td>
	 </tr>
	 <tr>
	 <td>몸무게</td>
	 <td><input type="text" size="5" name="weight">(kg)</td>
	 </tr>
	 </table>
	 
	 </form>
</body>
</html>