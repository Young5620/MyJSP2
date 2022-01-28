package com.ok;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/modify_ok")
public class modify_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public modify_ok() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//정보 수정을 위한 페이지 이동시 DB정보를 얻기 위한 작업
		//DB에서 가져올 정보는 session에서 id값을 얻어옴(user_id로)
		HttpSession session = request.getSession(); //세션객체생성
		String id = (String)session.getAttribute("user_id");
		
		//DB연동
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "myjsp";
		String password = "myjsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from testusers where id=?";
		
		try {
			//1. 드라이버로드
			Class.forName(driver);
			//2. 커넥션 객체생성
			conn = DriverManager.getConnection(url, user, password);
			//3. PreparedStatement 객체생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			//4. SQL구문 동작
			rs = pstmt.executeQuery();
			
			/*
			 rs.next()를 이용하여 레코드 정보를 조회. 
			 rs.getString()..pw,name,phone1,phone2,gender,email 
			 request를 이용하여 강제로 저장한 후에 포워드로 update.jsp로 이동
			 */
			if(rs.next()) {
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				//request에 강제로 저장
				request.setAttribute("user_name", name);
				request.setAttribute("user_pw", pw);
				request.setAttribute("user_phone1", phone1);
				request.setAttribute("user_phone2", phone2);
				request.setAttribute("user_email", email);
				request.setAttribute("user_gender", gender);
				
				RequestDispatcher dp = request.getRequestDispatcher("update.jsp");
				dp.forward(request, response);
			} else {}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			} catch(Exception e2) {}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
