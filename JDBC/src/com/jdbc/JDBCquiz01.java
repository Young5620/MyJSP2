package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCquiz01 {

	public static void main(String[] args) {
		//id를 입력받아 해당 ID에 속한 정보만 출력하는 예제
		Scanner scan = new Scanner(System.in);
		System.out.println("id를 입력하세요.> ");
		String id = scan.next();
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		Connection conn	= null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where id='"+id+"'";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String id1 = rs.getString("id");
				String pw1 = rs.getString("pw");
				String name1 = rs.getString("name");
				String email1 = rs.getString("email");
				System.out.println("----------검색한 id : "+id+"님 정보-----------");
				System.out.println("id:"+id1+"\npw:"+pw1+"\nname:"+name1+"\nemail:"+email1);
			} else {
				System.out.println(id+"는 없습니다.");
			}
		} catch(ClassNotFoundException cnfe) {
			System.out.println("드라이버 로딩 실패" + cnfe.toString());
		} catch(SQLException sqle){
			System.out.println("DB연결 실패" + sqle.toString());
		} catch(Exception e) {
			System.out.println("알 수 없는 오류");
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
			} catch(Exception e1) {}
		}
	}
}
