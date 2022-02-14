package test02.ex02.setter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseDev {
	private String driver;
	private String url;
	private String uid;
	private String upw;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public DatabaseDev() {
		
	}
	
	public DatabaseDev(String driver, String url, String uid, String upw) {
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(url,uid,upw);
			System.out.println("드라이버 연결성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) conn.close();
			} catch(Exception e2) {
				
			}
		}
	}
	
	public void test() {
		try {
			this.conn = DriverManager.getConnection(url, uid, upw);
			System.out.println("드라이버 연결성공");
		} catch (Exception e) {
			System.out.println("드라이버 연결실패");
		}
		System.out.println("url : " + this.url);
		System.out.println("uid : " + this.uid);
		System.out.println("upw : " + this.upw);
	}

	public ResultSet testQuery(String sql) {
		try {
			this.conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}


	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}
}
