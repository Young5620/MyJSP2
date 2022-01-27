package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCtest2 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("id>");
		String id = scan.next();
		System.out.println("pw>");
		String pw = scan.next();
		System.out.println("name>");
		String name = scan.next();
		System.out.println("email>");
		String email = scan.next();
		
		/*
		 * System.out.println("입력아이디 : " +id+ "\n입력암호 : " + pw + "\n입력이름 : " + name +
		 * "\n입력이메일 : " + email);
		 */
		
		//DB연결을 위한 변수
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		//ResultSet 객체는 선언안함.. 왜? select문에서만 사용
		
		String sql = "insert into member values ('"+id+"','"+pw+"','"+name+"','"+email+"')";
		
		try {
			//1.jdbc드라이버 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2.커넥션
			conn = DriverManager.getConnection(url,uid,upw);
			
			//3.sql문을 전달할 객체생성(Statement객체)
			stmt = conn.createStatement();
			
			//4. 실행(성공시 1, 실패시 0을 반환)
			int result = stmt.executeUpdate(sql);
			
			if(result==1) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
		} catch(ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패 : " + cnfe.toString());
		} catch(SQLException sqle) {
			System.out.println("DB연결 실패 : " + sqle.toString());
		} catch(Exception e) {
			System.out.println("알 수 없는 에러");
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
			} catch (Exception e2) {}
			
		}
	}

}
