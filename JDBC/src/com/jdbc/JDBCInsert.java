package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class JDBCInsert {

	public static void main(String[] args) throws ClassNotFoundException, SQLException{
		// 입력값을 받는 코드
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
		
		//1.jdbc드라이버 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2.Connection 객체를 생성
		conn = DriverManager.getConnection(url,uid,upw);
		
		//3.SQL쿼리를 전달할 Statement 객체를 생성
		stmt = conn.createStatement();
		
		//4.Statement객체에 SQL포함하여 전달
		int result = stmt.executeUpdate(sql);
		
		if(result == 1) {
			System.out.print("입력성공");
		} else {
			System.out.println("입력실패");
		}
		
		//5.객체종료
		conn.close();
		stmt.close();
	}
}
