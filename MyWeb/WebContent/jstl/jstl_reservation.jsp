<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->

  <section>
  <div align="center">
  <h2>콘서트예약</h2>
  <h4>예약할 좌석을 선택하세요</h4>
  <hr>
  <form action="jstl_reserv_ok.jsp" method="post">
  <b>좌석배치도</b><br>
  <c:forEach var="i" begin="1" end="6">
  ${i}
  </c:forEach>
  </form>
  </div>
  </section>

  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer -->
</body>
</html>