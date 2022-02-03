package com.ok;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join_ok")
public class join_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public join_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1.입력값 처리(form)
	//2.DB연동 처리
	//3.처리결과에 따른 뷰(view) 성공시 : success -> 성공메세지 출력
	//                    실패시 : Fail -> 실패메세지 전송 -> 로그인 or 회원가입 페이지
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	
	//DAO객체 생성
	MemberDAO dao = MemberDAO.getInstance();
	
	//VO객체 생성
	MemberVO vo = new MemberVO(id, pw, name, phone1, phone2, email, gender);
	
	//DAO에 join메서드를 사용
	int result = dao.join(vo);
	
	/*
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	String user = "myjsp";
	String password = "myjsp";
	
	Connection conn = null;
	//Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
//	String sql = "insert into testusers values ('"+id+"','"
//				+pw+"','"+name+"','"+phone1+"','"+phone2+"','"
//				+email+"','"+gender+"')";
	String sql = "insert into testusers values(?,?,?,?,?,?,?)";
	*/
/*	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
//		stmt = conn.createStatement();
//		int result = stmt.executeUpdate(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, phone1);
		pstmt.setString(5, phone2);
		pstmt.setString(6, email);
		pstmt.setString(7, gender);
		
		int result = pstmt.executeUpdate();
		*/
		if(result==1) {
			response.sendRedirect("join_success.jsp");
		} else {
			response.sendRedirect("join_fail.jsp");
		}
		/*
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn!=null) conn.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		} catch(Exception e1) {}
	}*/
	}

}
