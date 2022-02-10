<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->
  <section>
    <div align="center" class="div_center">
      <h3>게시글 내용보기</h3>
      <hr>
      <table border="1" width="500">
  	    <tr>
  	      <td width="20%">글번호</td>
  	      <td width="30%">${vo.num }</td> <!-- DB로부터 전달 받을 부분 -->
  	      <td width="20%">조회수</td>
  	      <td width="30%">${vo.hit }</td> <!-- DB로부터 전달 받을 부분 -->
  	    </tr>
  	    <tr>
  	      <td width="20%">작성자</td>
  	      <td width="30%">${vo.writer }</td> <!-- DB로부터 전달 받을 부분 -->
  	      <td width="20%">작성일</td>
  	      <td width="30%">${vo.regdate }</td> <!-- DB로부터 전달 받을 부분 -->
  	    </tr>
  	    <tr>
	      <td width="20%">글제목</td>
	      <td colspan="3" width="30%">${vo.title }</td> <!-- DB로부터 전달 받을 부분 -->
	    </tr>
	    <tr>
	      <td width="20%">글내용</td>
	      <td colspan="3" width="30%" height="120px">${vo.content }</td> <!-- DB로부터 전달 받을 부분 -->
	    </tr>	
	    <tr>
	      <td colspan="4" align="center">
	      <input type="button" value="목록" onclick="location.href='list.board'">&nbsp;&nbsp;
	      <input type="button" value="수정" onclick="location.href='modify.board?num=${vo.num}'">&nbsp;&nbsp;
	      </td>
	    </tr>
      </table>
    </div>
  </section>
  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer -->
</html>