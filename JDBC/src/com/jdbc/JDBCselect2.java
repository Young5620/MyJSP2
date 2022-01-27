package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCselect2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,uid,upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs!=null) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
			
			//레코드 번호표시
			int i = 1;
			
			while(rs.next()) {
				String id2 = rs.getString("id");
				String pw2 = rs.getString("pw");
				String name2 = rs.getString("name");
				String email2 = rs.getString("email");
				
				System.out.println("------------"+i+"번째------------------");
				System.out.println("DB로부터 받은 id값 : " + id2);
				System.out.println("DB로부터 받은 pw값 : " + pw2);
				System.out.println("DB로부터 받은 name값 : " + name2);
				System.out.println("DB로부터 받은 email값 : " + email2);
				i++;
			}
		} catch (ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패 : " + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB연결 실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("알 수 없는 오류");
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e1) {}
		}
	}

}
