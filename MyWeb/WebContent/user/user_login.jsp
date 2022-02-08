<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->

<!-- 1.MyWeb사이트와 연동되어야한다.
	 2.로그인시 필요한 아이디와 비밀번호를 입력받게 설정
	 3.로그인 버튼과 회원가입버튼을 생성 -->

    <div align="center">
      <h2>로그인</h2>
      <hr>
      <form name="logform" action="user_login_ok.jsp" method="post">
        <table>
          <tr>
            <td>아이디</td>
            <td><input type="text" name="id" placeholder="아이디를 입력하세요"></td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></td>
          </tr>
          <tr align="center">
            <td colspan=2><input type="button" value="로그인" class="btn-default" onclick="check()">
	        <input type="button" value="회원가입" class="btn-primary" onclick="location.href='user_join.jsp'"></td>
          </tr>
        </table>
      </form>
    </div>

  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer -->

  <script>
    function check() {
	  if(document.logform.id.value==null) {
          alert("아이디를 입력하세요");
		  return;
      } else if (document.logform.pw.value==null) {
		  alert("비밀번호를 입력하세요");
	      return;
	  } else if(document.logform.id.value!=null && document.logform.pw.value!=null) {
		  document.logform.submit();
	  }
    }
</script>
</html>