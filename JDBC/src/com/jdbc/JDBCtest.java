package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCtest {
	public static void main(String[] orgs) {
		//Oracle 설정
		String driver_oracle = "oracle.jdbc.driver.OracleDriver";
		String url_oracle = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		
		//Mariadb설정
		//Mariadb url => jdbc:mysql://[주소 또는 도메인]:[포트번호]/[DB이름]
		String driver_mariadb = "org.mariadb.jdbc.Driver";
		String url_mariadb = "jdbc:mysql://localhost:3306/testdb";
		
		//MySQL 버전 6이상
		String driver_mysql = "com.mysql.cj.jdbc.Driver";
		String url_mysql = "jdbc:mysql://localhost:3306/testdb?serverTimezone=Asia/Seoul";
		
		//MySQL 버전 6이하
		String driver_mysql_pre6 = "com.mysql.jdbc.Driver";
		String url_mysql_pre6 = "jdbc:mysql://localhost:3306/testdb";
				
		//DB접속 계정 정보
		String user = "myjsp";
		String password = "myjsp";
		
		//Mariadb 사용자
		String m_user = "root";
		String m_password = "0000";
		
		//연결을 위한 객체생성
		Connection con = null;
		
		//connection값을 판별하는 boolean값
		Boolean connect = false;
		
		try {
			//1. 드라이버 로딩
			Class.forName(driver_mariadb);
			
			//2. DB연결
			con = DriverManager.getConnection(url_mariadb, m_user, m_password);
			connect = true;
		} catch(ClassNotFoundException cnfe) {
			//드라이버 로딩 실패시 예외
			connect = false;
			System.out.println("DB 드라이버 로딩 실패 : " + cnfe.toString());
		} catch(SQLException sqle) {
			//Connection 실패시 에러(SQLException)
			connect = false;
			System.out.println("DB 접속 실패 : " + sqle.toString());
		} catch (Exception e) {
			//Unknown 에러
			connect = false;
			System.out.println("알 수 없는 에러 ");
			e.printStackTrace();
		}
		
		if(connect) {
			System.out.println("연결 성공");
		} else {
			System.out.println("연결 실패");
		}
	}
}
