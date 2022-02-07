<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<!-- header -->
<%@ include file="../include/_header.jsp" %>
<!-- /.header -->
<section>
<div align="center">
<h2>비밀번호 변경</h2>
<hr>
<form name="pw_change" action="user_change_pw_ok.jsp" method="post">
<table>
<tr>
<td>현재 비밀번호</td>
<td><input type="password" name="old_pw"></td>
</tr>
<tr>
<td>변경 비밀번호</td>
<td><input type="password" name="new_pw"></td>
</tr>
<tr>
<td>변경 비밀번호 확인</td>
<td><input type="password" name="new_pw_check"></td>
</tr>
<tr align="center">
<td colspan=2><input type="submit" value="확인" onclick="check()">
<input type="button" value="취소" onclick="history.go(-1)"></td>
</tr>
</table>
</form>
</div>
</section>
<!-- footer -->
<%@ include file="../include/_footer.jsp" %>
<!-- /.footer -->
<script>
function check() {
	if(document.pw_change.new_pw.value != document.pw_change.new_pw_check.value) {
		alert("입력한 비밀번호가 다릅니다.");
		return;
	}
}
</script>
</html>