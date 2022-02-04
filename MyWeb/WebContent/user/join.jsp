<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<%@ include file="../include/_header.jsp" %>
<!-- /.header -->

<!-- 회원가입을 위한 폼태그 작성 -->
<section>
  <div align="center">
  <!-- 회원가입을 위한 폼태그 위치 -->
    <form name="regform" action="user_join_ok.jsp" method="post">
    <h2>회원가입 페이지</h2>
    <table>
    <tr>
    <td>아이디</td>
    <td><input type="text" name="id" placeholder="4글자 이상 8글자 이하"></td>
    </tr>
    <tr>
    <td>비밀번호</td>
    <td><input type="password" name="pw"></td>
    </tr>
    <tr>
    <td>비밀번호 확인</td>
    <td><input type="password" name="pw_check"></td>
    </tr>
    <tr>
    <td>이름</td>
    <td><input type="text" name="name"></td>
    </tr>
    <tr>
    <td>이메일</td>
    <td><input type="text" name="email"></td>
    </tr>
    <tr>
    <td>주소</td>
    <td><input type="text" name="address"></td>
    </tr>
    </table>
    <input type="button" value="회원가입" class="btn-primary" onclick="check()">
    <input type="button" value="로그인" class="btn-info">
    </form>
  </div>
</section>


<!-- footer -->
<%@ include file="../include/_footer.jsp" %>
<!-- /.footer -->

<script type="text/javascript"> 
	function check () {
		//form은 document.태그이름.태그이름으로 하위태그에 접근이 가능함. 
		//console.log (document.regform.id.value); 을 이용하여 접근확인 가능 
		if(document.regform.id.value==' ') {  
			alert("아이디는 필수사항 입니다");
			return; 
	} else if(document.regform.id.value.length<4 || document.regform.id.value.length>8) {
			alert("아이디는 4글자 이상 8글자 이하로 입력하세요.");
			return;
	} else if (document.regform.pw.value==' ' )  {  
			alert("비밀번호는 필수사항 입니다.");
			return; 
	} else if (document.regform.pw.value!=document.regform.pw_check.value) {
			alert("비밀번호 확인란을 확인해주세요.");	
			return; 
	} else if (document.regform.name.value==' ') {   
			alert("이름은 필수사항 입니다.");
	} else if (confirm("회원가입을 하시겠습니까?")) { 
			//confirm() 확인창에 "예" 클릭하면 true를 반환, "아니오" 클릭시 false를 반환 
			document.regform.submit(); //자바스크립트를 이용한 submit()기능 
	}}
			
	
	
</script>


</html>

