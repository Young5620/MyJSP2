package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCselect1 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException{
		//DB연결을 위한 변수 url, uid, upw
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid = "myjsp";
		String upw = "myjsp";
		
		//연동을 위한 필요 클래스를 변수 선언
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//SQL구문
		String sql = "select * from member";
		
		//1.드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2.커넥션 생성
		conn = DriverManager.getConnection(url,uid,upw);
		
		//3.Statement 객체생성
		stmt = conn.createStatement();
		
		//4.sql문 실행
		rs = stmt.executeQuery(sql);
		
		//rs 객체값을 어떻게 사용하지?
		while(rs.next()) {
			//rs.getString(컬럼명) 메서드를 사용하여 문자열 결과를 얻을 수 있음
			//rs.getInt(컬럼명) 메서드를 사용하여 정수숫자데이터를 얻을 수 있음
			//rs.getDouble(컬럼명) 메서드를 사용하여 실수 숫자데이터를 얻을  수 있음
			//rs.getTimeStamp(컬럼명) 메서드를 사용하여 날짜 데이터를 얻을 수 있음
			String id1 = rs.getString("id");
			String pw1 = rs.getString("pw");
			String name1 = rs.getString("name");
			String email1 = rs.getString("email");
			System.out.println("---------------------------------------------------");
			System.out.println("DB로부터 받은 id 값 "+id1);
			System.out.println("DB로부터 받은 pw 값 "+pw1);
			System.out.println("DB로부터 받은 name 값 "+name1);
			System.out.println("DB로부터 받은 email 값 "+email1);
		}
		//5.객체해제
		conn.close();
		stmt.close();
		rs.close();
	}
}
