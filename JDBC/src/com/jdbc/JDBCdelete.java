package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;



public class JDBCdelete {

	public static void main(String[] args) throws ClassNotFoundException, SQLException{
		
		Scanner scan = new Scanner(System.in);
		System.out.println("id를 입력하세요>");
		String check_id = scan.next();
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn = null;
		Statement stmt = null;
		
		String sql = "delete from member where id='"+check_id+"'";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url,uid,upw);
		
		stmt = conn.createStatement();
				
		int result = stmt.executeUpdate(sql);
		
		if(result==1) {
			System.out.println("삭제가 완료되었습니다.");
		} else {
			System.out.println("id가 틀립니다.");
		}
		
		conn.close();
		stmt.close();
	}

}
