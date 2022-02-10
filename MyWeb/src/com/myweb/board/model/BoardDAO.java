package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class BoardDAO {
	
	private DataSource ds;
	
	//1. 스스로 객체를 멤버변수로 선언하고 1개로 제한 - 싱글톤
	private static BoardDAO instance= new BoardDAO();
	
	//2. 외부에서 객체를 생성할 수 없도록 private 설정함
	private BoardDAO() {
		try {
			InitialContext ctx = new InitialContext(); // Context.xml 값에 저장된 설정을 저장
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("Connection Pool 연결오류");
		}
	}
	
	//3. 외부에서 객체를 요구할 때 getter메서드만 짜서 반환
	public static BoardDAO getInstance() {
		return instance;
	}
	
	//--------------중복되는 코드를 멤버변수로 선언--------------//
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//--------------기능 메서드 구현------------------//
	
	//게시글 등록 메서드
	public void regist(String writer, String title, String content) {
		String sql = "insert into board (writer,title,content) values (?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
	}
	
	//글 목록 조회 메서드
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by num desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardVO vo = new BoardVO(); 
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer")); 
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate")); 
				vo.setHit(rs.getInt("hit"));
				list.add(vo);
				/*
				 * int num = rs.getInt("num"); 
				 * String writer = rs.getString("writer"); 
				 * String title = rs.getString("title"); 
				 * String content = rs.getString("content");
				 * Timestamp regdate = rs.getTimestamp("regdate"); 
				 * int hit = rs.getInt("hit");
				 * BoardVO vo = new BoardVO(num, writer, title, content, regdate, hit);
				 */
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
		return list;
	}
	
	//글 상세정보 조회 메서드
	public BoardVO getContent(String num) {
		BoardVO vo = null;
		
		String sql = "select * from board where num = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				vo = new BoardVO(Integer.parseInt(num), writer, title, content, regdate, hit);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
		return vo;
	}
	
	//글 정보수정 메서드
	public void update(String title, String content, String num) {
		String sql = "update board set title=?, content=?, regdate=sysdate where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(num));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
	}
	
	//글 삭제 메서드
	public void delete(String num) {
		String sql = "delete from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
	}
	
	//조회수 증가 메서드
	public void upHit(String num) {
		String sql = "update board set hit=hit+1 where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.Close(conn, pstmt, rs);
		}
	}
}
