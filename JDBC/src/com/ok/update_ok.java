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

@WebServlet("/update_ok")
public class update_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public update_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//form데이터 처리
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		
		/*
		 1. 폼데이터 값을 VO에 저장
		 2. DAO객체를 생성하고, update메서드로 vo객체를 전달
		 3. update메서드 안에서는 executeUpdate() 메서드로 실행
		 	1을 반환하면 update_success.jsp로 이동
		 	0을 반환하면 mypage.jsp로 이동
		 */
		
		//폼데이터 값을 VO에 저장
		MemberVO vo = new MemberVO(id, pw, name, phone1, phone2, email, gender);
		//DAO객체 생성하고 update메서드로 vo객체를 전달
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.update(vo);
		//결과값 처리
		if(result==1) {
			response.sendRedirect("update_success.jsp");
		} else {
			response.sendRedirect("mypage.jsp");
		}
	}

}
