package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCdelete2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		Scanner scan = new Scanner(System.in);
		System.out.println("id를 입력하세요>");
		String check_id = scan.next();
		
		String sql = "delete from member where id='"+check_id+"'";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			if(result==1) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
		} catch(ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패 : " + cnfe.toString());
		} catch(SQLException sqle) {
			System.out.println("DB연결 실패 :" + sqle.toString());
		} catch(Exception e) {
			System.out.println("알 수 없는 오류");
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
			} catch(Exception e) {}
			
		}
		
		
		

	}

}
