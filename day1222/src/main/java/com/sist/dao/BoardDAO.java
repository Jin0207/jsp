package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.BoardVO;

public class BoardDAO {
	public int getNextNo() {
		int no = 0;
		String sql = "select nvl(max(no),0)+1 from board";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				no = rs.getInt(1);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return no;
	}
	
	public int insertBoard(BoardVO b) {
		int re = -1;
		String sql = "insert into board values(?,?,?,?,?,sysdate,0,?,?)";
		int no = getNextNo();
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getWriter());
			pstmt.setString(4, b.getPwd());
			pstmt.setString(5, b.getContent());
			pstmt.setString(6, b.getFname());
			pstmt.setLong(7, b.getFsize());
			
			re = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt);
		}
		
		return re;
	}
	public int updateBoard(BoardVO b) {
		int re = -1;
		String sql = "update board set title=?, content=?, fname=?, fsize=? where no=? and pwd=?";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getFname());
			pstmt.setLong(4, b.getFsize());
			pstmt.setInt(5, b.getNo());
			pstmt.setString(6, b.getPwd());
			
			re=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt);
		}
		return re;
	}
	
	public int deleteBoard(int no, String pwd) {
		int re = -1;
		String sql = "delete board where no =? and pwd =?";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, pwd);
			re=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt);
		}
		return re;
	}
	
	public ArrayList<BoardVO> listBoard(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		String sql = "select * from board order by no desc";
		Connection conn = ConnectionProvider.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						             rs.getString(4), rs.getString(5), rs.getDate(6), 
						             rs.getLong(7), rs.getString(8), rs.getInt(9)));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, stmt, rs);
		}
		return list;
	}
	
	public BoardVO getBoard(int no) {
		BoardVO b = null;
		String sql = "select * from board where no =?";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b = new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
						        rs.getString(4), rs.getString(5), rs.getDate(6), 
						        rs.getLong(7), rs.getString(8), rs.getInt(9));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt, rs);
		}
		return b;
	}
	
}
