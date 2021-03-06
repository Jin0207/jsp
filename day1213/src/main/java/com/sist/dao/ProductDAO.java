package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import com.sist.vo.Product;

public class ProductDAO {
	int re=-1;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "c##madang";
	private String pwd = "madang";
	
	public int insertProduct(Product p){
		String sql="insert into goods(no,name,price,qty) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn= DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,p.getNo());
			pstmt.setString(2, p.getName());
			pstmt.setInt(3,p.getPrice());
			pstmt.setInt(4,p.getQty());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("???ܹ߻?:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return re;
	}
}
