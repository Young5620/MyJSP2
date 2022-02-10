<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->
  <section>
    <div align="center" class="div_center">
      <h3>게시글 내용수정하기</h3>
      <hr>
      <form name="regform" action="update.board" method="post">
        <table border="1" width="500">
  	      <tr>
  	        <td>글번호</td>
  	        <td><input type="text" name="num" value="${vo.num }" readonly></td>
  	      </tr>
  	      <tr>
  	        <td>작성자</td>
  	        <td><input type="text" name="writer" value="${vo.writer }" readonly></td>
  	      </tr>
  	      <tr>
	        <td>글제목</td>
	        <td><input type="text" name="title" value="${vo.title }"></td>
	      </tr>
	      <tr>
	        <td>글내용</td>
	        <td><textarea rows="10" style="width:95%;" name="content"></textarea></td>
	      </tr>	
	      <tr>
	        <td colspan="2" align="center">
	          <input type="button" value="수정하기" onclick="modifyCheck()">&nbsp;&nbsp;
	          <input type="button" value="목록" onclick="location.href='list.board'">&nbsp;&nbsp;
	          <input type="button" value="삭제하기" onclick="(confirm('정말로 삭제하시겠습니까?') ? location.href='delete.board?num=${vo.num}':'')">&nbsp;&nbsp;
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
  function modifyCheck() {
	  if(document.regform.title.value==""){
		  alert("제목을 입력하세요");
		  return;
	  } else if(confirm("정말로 게시글을 수정하시겠습니까?")) {
		  document.regform.submit();
	  }
  }
  </script>
</html>