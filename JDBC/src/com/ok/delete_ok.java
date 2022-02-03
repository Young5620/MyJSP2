package com.ok;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete_ok")
public class delete_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public delete_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 delete from 테이블명 where = id
		 1. 아이디는 세션에서 얻는다.
		 2. pstmt를 이용해서 삭제를 진행
		 3. 사용 메서드는 executeUpdate()로 sql문을 실행...(인자x)
		 	->1을 반환 : 쿼리 성공 -> 세션을 전부 삭제후에 login.jsp로 이동
		 	->0을 반환 : 쿼리 실패 -> mypage.jsp
		 */
		HttpSession session = request.getSession(); //세션객체생성
		String id = (String)session.getAttribute("user_id");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.delete(id);
			
			if(result==1) {
				//성공시
				session.invalidate();
				response.sendRedirect("login.jsp");
			} else {
				//실패시
				response.sendRedirect("mypage.jsp");
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
