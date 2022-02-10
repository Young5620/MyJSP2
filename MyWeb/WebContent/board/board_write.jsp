<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->
  
  <section>
    <div align="center" class="div_center">
  	  <h2>게시판 글 작성 페이지</h2>
  	  <hr>
  	
  	  <form name="regform" action="register.board" method="post">
  	    <table border="1" width="500">
  	      <tr>
  	        <td>작성자</td>
  	        <td><input type="text" name="writer" size="10" value="${sessionScope.user_id }"></td>
  	      </tr>
  	      <tr>
  	        <td>글 제목</td>
  	        <td><input type="text" name="title"></td>
  	      </tr>
  	      <tr>
  	        <td>글 내용</td>
  	        <td><textarea rows="10" style="width:95%;" name="content"></textarea></td>
  	      </tr>
  	      <tr>
  	      	<td colspan="2" align="center">
  	      		<input type="button" value="작성완료" onclick="registCheck()">
  	      		<input type="button" value="목록" onclick="location.href='list.board'">
  	      	</td>
  	      </tr>
  	    </table>
  	  </form>
    </div>
  </section>
  
  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer --> 
  
  <script>
  function registCheck() {
	  
	  if(document.regform.writer.value=="") {
		  alert("작성자를 입력하세요.");
		  return;
	  } else if(document.regform.title.value=="") {
		  alert("글 제목을 입력하세요.");
		  return;
	  } else if(confirm("게시글을 등록하겠습니까?")) {
		  document.regform.submit();
	  }
  }
  </script> 
</html>