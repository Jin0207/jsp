package com.sist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.BoardVO;

import oracle.jdbc.proxy.annotation.Pre;

public class BoardDAO {
	public static int pageSIZE = 10;
	public static int totalRecord;
	public static int totalPage;
	
	//전체 레코드의 수를 반환하는 메소드 정의
	public int getTotalRecord(String keyword, String searchColum) {
		int n = 0;
		String sql = "select nvl(count(*),0) from board";
		
		if(keyword != null) {
			sql += " where " + searchColum + " like '%"+ keyword +"%'";
		}
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				n = rs.getInt(1);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
		return n;
	}
	
	public void updateHit(int no) {
		String sql = "update board set hit = hit + 1 where no = ?";
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt);
		}
	}
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
		String sql = "insert into board values(?,?,?,?,?,sysdate,0,?,?,?,?,?)";
		//int no = getNextNo();
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getNo());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getWriter());
			pstmt.setString(4, b.getPwd());
			pstmt.setString(5, b.getContent());
			pstmt.setString(6, b.getFname());
			pstmt.setLong(7, b.getFsize());
			pstmt.setInt(8, b.getB_ref());
			pstmt.setInt(9, b.getB_level());
			pstmt.setInt(10, b.getB_step());
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
	
	public ArrayList<BoardVO> listBoard(int pageNUM, String orderColum, String searchColum, String keyword){
		totalRecord = getTotalRecord(keyword, searchColum);
		totalPage = (int)Math.ceil((double)totalRecord / pageSIZE);
		System.out.println("전체레코드 수" + totalRecord);
		System.out.println("전체페이지 수" + totalPage);
		
		int start = (pageNUM-1)* BoardDAO.pageSIZE + 1;
		int end= start + BoardDAO.pageSIZE - 1;
		
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		String sql2 = "select rownum n, no, title, writer, pwd, content, regdate, hit, fname, fsize, b_ref, b_level, b_step from board ";
		if(keyword != null) {
			sql2 += "where " + searchColum + " like '%"+ keyword +"%'";
		}
		
		String sql = "select no, title, writer, pwd, content, regdate, hit, fname, fsize, b_ref, b_level, b_step "
				+ "from ( " +  sql2 + "order by b_ref desc, b_step) where n between ? and ?";
		
		if(orderColum != null) {
			sql = "select no, title, writer, pwd, content, regdate, hit, fname, fsize, b_ref, b_level, b_step "
					+ "from ("+sql2+" order by "+orderColum+") where n between ? and ?";
		}
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), 
				        rs.getString(4), rs.getString(5), rs.getDate(6), 
				        rs.getInt(7), rs.getString(8), rs.getLong(9), rs.getInt(10), rs.getInt(11), rs.getInt(12)));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt, rs);
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
				        rs.getInt(7), rs.getString(8), rs.getLong(9), 
				        rs.getInt(10), rs.getInt(11), rs.getInt(12));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			ConnectionProvider.close(conn, pstmt, rs);
		}
		return b;
	}

	public void updateStep(int b_ref, int b_step) {
		String sql = "update board set b_step = b_step + 1 where b_ref=? and b_step > ?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_ref);
			pstmt.setInt(2, b_step);
			pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}
	}
	
}
