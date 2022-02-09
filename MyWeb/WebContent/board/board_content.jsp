<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->
  
  <h3>게시글 내용보기</h3>
  <hr>
  <table>
  	<tr>
  	  <td>글번호</td>
  	  <td>${vo.num }</td>
  	  <td>조회수</td>
  	  <td>${vo.hit }</td>
  	</tr>
  	<tr>
  	  <td>작성자</td>
  	  <td>${vo.writer }</td>
  	  <td>작성일</td>
  	  <td>${vo.regdate }</td>
  	</tr>
  	<tr>
	  <td>글제목</td>
	  <td>${vo.title }</td>
	</tr>
	<tr>
	  <td>글내용</td>
	  <td>${vo.content }</td>
	</tr>	
	<tr>
	  <td colspan="4" align="center">
	  <input type="button" value="목록" onclick="location.href='list.board'">&nbsp;&nbsp;
	  <input type="button" value="수정" onclick="location.href='modify.board?bno=${vo.num}'">&nbsp;&nbsp;
	  <input type="button" value="삭제" onclick="location.href='delete.board?bno=${vo.num}'">&nbsp;&nbsp;
	  </td>
	</tr>
  </table>
  
  
  
  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer -->
</html>