package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCPinsert {

	public static void main(String[] args) {
		//입력값 받는 처리(member)
		Scanner scan = new Scanner(System.in);
		System.out.println("id>");
		String id = scan.next();
		System.out.println("pw>");
		String pw = scan.next();
		System.out.println("name>");
		String name = scan.next();
		System.out.println("email>");
		String email = scan.next();
		
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String user = "myjsp";
		String password = "myjsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into member values(?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			//pstmt 객체에 값을 설정시 setString, setInt, setDouble...
			//pstmt 객체에 값을 불러올경우 getString, getInt, getDouble...
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			//pstmt 실행 (성공시1,실패시0을 반환)
			int result = pstmt.executeUpdate(); //주의 sql구문을 인자로 전달하지 않는다.
			
			if(result==1) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

}
