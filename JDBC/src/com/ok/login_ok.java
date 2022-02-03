package com.ok;

import java.io.IOException;

import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login_ok")
public class login_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public login_ok() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		int result = dao.login(id,pw);
		
			if(result==1) {
				//로그인 성공 페이지
				//servlet에서 톰캣내장객체 불러오기
				HttpSession session = request.getSession();
				session.setAttribute("user_id", id);
				response.sendRedirect("mypage.jsp");
			} else {
				response.sendRedirect("login_fail.jsp");
			}
			/*
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}*/
	}

}
