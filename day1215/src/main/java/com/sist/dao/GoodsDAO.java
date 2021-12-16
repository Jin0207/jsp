package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.GoodsVO;

public class GoodsDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "c##madang";
	private String pwd = "madang";
	
	private GoodsDAO() {
		
	}
	
	private static GoodsDAO dao = null;
	
	public static GoodsDAO getInstance() {
		if(dao == null) {
			dao = new GoodsDAO();
		}
		return dao;
	}
	//��� ��ǰ ����� ��ȯ�ϴ� �޼ҵ�
	public ArrayList<GoodsVO> listAll(){
		String sql="select * from goods";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new GoodsVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			} catch (Exception e2) {
			}
		}
		return list;
	}
	
	//��ǰ������ ��ȯ�ϴ� �޼ҵ�
	public GoodsVO getGoods(int no) {
		GoodsVO vo = new GoodsVO();
		
		String sql = "select * from goods where no=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPrice(rs.getInt(3));
				vo.setQty(rs.getInt(4));
				vo.setFname(rs.getString(5));
			}
			
		} catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		return vo;
	}
	
	//��ǰ�� �߰��ϴ� �޼ҵ�
	public int insert(GoodsVO g) {
		int re = -1;
		String sql = "insert into goods values(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, g.getNo());
			pstmt.setString(2, g.getName());
			pstmt.setInt(3, g.getPrice());
			pstmt.setInt(4, g.getQty());
			pstmt.setString(5, g.getFname());
			
			re=pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		return re;
	}
	
	//��ǰ������ �����ϴ� �޼ҵ�
		public int update(GoodsVO g) {
			int re = -1;
			String sql = "update goods set name=?, price=?, qty=?, fname=? where no=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				Class.forName(driver);
				conn= DriverManager.getConnection(url, user, pwd);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, g.getName());
				pstmt.setInt(2, g.getPrice());
				pstmt.setInt(3, g.getQty());
				pstmt.setString(4, g.getFname());
				pstmt.setInt(5, g.getNo());
				
				re=pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("���ܹ߻�:"+e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (Exception e2) {
				}
			}
			return re;
		}
		
		//��ǰ������ �����ϴ� �޼ҵ�
		public int delete(int no) {
			int re = -1;
			String sql = "delete goods where no=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				Class.forName(driver);
				conn= DriverManager.getConnection(url, user, pwd);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,no);
				
				re=pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("���ܹ߻�:"+e.getMessage());
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();
				} catch (Exception e2) {
				}
			}
			return re;
		}
}
