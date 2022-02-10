<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
  <!-- header -->
  <%@ include file="../include/_header.jsp" %>
  <!-- /.header -->
  <div class="container">
  	<h3>MyWeb 게시판</h3>
  	<table class="table table-bordered">
  	<!-- 게시글 -->
  	  <thead>
  	  	<tr>
  	  	  <th>글번호</th>
  	  	  <th>작성자</th>
  	  	  <th>제목</th>
  	  	  <th>날짜</th>
  	  	  <th>조회수</th>
  		</tr>
	  </thead>
	  
	  <!-- DB로부터 게시글 정보를 알아서 전달 -->
	  <tbody>
	  <c:forEach var="vo" items="${list }">
	    <tr>
	      <td>${vo.num }</td>
	      <td>${vo.writer}</td>
	      <td><a href="content.board?num=${vo.num }">${vo.title }</a></td>
	      <td>${vo.regdate }</td>
	      <td>${vo.hit }</td>
	    </tr>
	    </c:forEach>
	  </tbody>
	  
	  <!-- 작성글 검색 및 글작성하기 메뉴 -->
	  <tbody>
	    <tr>
	      <td colspan="5" align="right">
	        <form action="search.board" class="form-inline">
	          <div class="form-group">
	            <input type="text" name="search" placeholder="제목검색" class="form-control">
	            <input type="submit" value="검색" class="btn btn-default">
	            <input type="button" value="글작성" class="btn btn-primary" onclick="location.href='/MyWeb/board/write.board'">
	          </div>
	        </form>
	      </td>
	    </tr>
	  </tbody>
  	</table>
  	
  	<!-- 페이지 작업하는 공간 -->
  	<div align="center">
	  <ul class="pagination pagination-sm">
	    <li><a href="#">이전</a></li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li><a href="#">다음</a></li>
	  </ul>  	
  	</div>
  </div>


  <!-- footer -->
  <%@ include file="../include/_footer.jsp" %>
  <!-- /.footer -->
</html>