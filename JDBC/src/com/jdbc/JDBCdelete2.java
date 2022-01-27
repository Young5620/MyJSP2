package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
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
		
		String sql = "delete from member where id="+"'"+check_id+"'";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url);
		}
		
		

	}

}
