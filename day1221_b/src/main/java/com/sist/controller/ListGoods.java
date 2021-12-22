package com.sist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

/**
 * Servlet implementation class ListGoods
 */
//@WebServlet("/ListGoods")
public class ListGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	GoodsDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListGoods() {
        super();
        dao = new GoodsDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자 요청에 따른 상태유지
		ArrayList<GoodsVO> list = dao.listAll();
		request.setAttribute("list", list);
		
		//어디로 가야할지 view페이지 결정
		String viewPage = "listGoods.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		//view페이지로 이동
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
