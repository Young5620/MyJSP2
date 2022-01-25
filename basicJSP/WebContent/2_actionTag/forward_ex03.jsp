<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>
  <body>
    <!-- form태그를 사용하여 ID를 입력받아 처리 -->
    <h2>Servlet을 이용한 forward</h2>
    <form action="../forward" method="post">
    ID : <input type="text" name="id"><br>
    <input type="submit" value="확인">
    </form>
    <hr>
    <h2>action태그을 이용한 forward</h2>
    <form action="forward.jsp" method="post">
    ID : <input type="text" name="id"><br>
    <input type="submit" value="확인">
    </form>
  </body>
</html>