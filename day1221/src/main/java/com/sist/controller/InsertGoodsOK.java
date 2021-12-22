package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

/**
 * Servlet implementation class InsertGoodsOK
 */
//@WebServlet("/InsertGoodsOK")
public class InsertGoodsOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private GoodsDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGoodsOK() {
        super();
        dao = new GoodsDAO();	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRealPath("upload");
		System.out.println("path:" + path);
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new  DefaultFileRenamePolicy());
		GoodsVO g = new GoodsVO();
		g.setNo(Integer.parseInt(multi.getParameter("no")));
		g.setPrice(Integer.parseInt(multi.getParameter("price")));
		g.setQty(Integer.parseInt(multi.getParameter("qty")));
		g.setName(multi.getParameter("name"));
		g.setFname(multi.getFilesystemName("uploadFile"));
		
		int re = dao.insertGoods(g);
		String viewPage = "";
		if(re==1) {
			viewPage = "insertGoodsOK.jsp";
		}else {
			viewPage = "error.jsp";
			request.setAttribute("msg", "상품등록에 실패하였습니다");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		dispatcher.forward(request, response);
		
	}

}
