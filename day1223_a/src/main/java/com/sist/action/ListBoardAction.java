package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

public class ListBoardAction implements SistAction {
	public BoardDAO dao;
	
	public ListBoardAction() {
		dao = new BoardDAO();
	}
	
	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//request를 통해 session을 얻어옴 -- 해당 메소드 안에는 session이없으니깐
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String orderColum = request.getParameter("orderColum");
		System.out.println("정렬컬럼:" + orderColum);
		
		String searchColum = request.getParameter("searchColum");
		System.out.println("검색컬럼"+searchColum);
		
		String keyword = request.getParameter("keyword");
		System.out.println("검색어:"+ keyword);
		
		//새로운 검색어가 없고, 그 대신, 아까 검색한게 있다면 세션에서 아까 검색한걸 가져온다
		if(keyword == null && session.getAttribute("keyword") != null) {
			searchColum = (String)(session).getAttribute("searchColum");
			keyword = (String)session.getAttribute("keyword");
		}
		
		//새로운 정렬컬럼이 없고 그 대신, 아까 정렬한게 있다면
		if(orderColum == null && session.getAttribute("orderColum") != null) {
			orderColum = (String)session.getAttribute("orderColum");
		}
	
		
		int pageNUM = 1;
		if(request.getParameter("pageNUM") != null) {
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		System.out.println("pageNUM:" + pageNUM);
		
		ArrayList<BoardVO> list = dao.listBoard(pageNUM,orderColum,searchColum,keyword);
		request.setAttribute("totalPage", BoardDAO.totalPage);
		request.setAttribute("list", list);
		
		if(keyword != null) {
			session.setAttribute("keyword", keyword); 
			session.setAttribute("searchColum", searchColum); 
		}
		
		if(orderColum != null) {
			session.setAttribute("orderColum", orderColum);
		}
		
		return "listBoard.jsp";
	}

}
