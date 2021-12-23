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
		
		//request�� ���� session�� ���� -- �ش� �޼ҵ� �ȿ��� session�̾����ϱ�
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String orderColum = request.getParameter("orderColum");
		System.out.println("�����÷�:" + orderColum);
		
		String searchColum = request.getParameter("searchColum");
		System.out.println("�˻��÷�"+searchColum);
		
		String keyword = request.getParameter("keyword");
		System.out.println("�˻���:"+ keyword);
		
		//���ο� �˻�� ����, �� ���, �Ʊ� �˻��Ѱ� �ִٸ� ���ǿ��� �Ʊ� �˻��Ѱ� �����´�
		if(keyword == null && session.getAttribute("keyword") != null) {
			searchColum = (String)(session).getAttribute("searchColum");
			keyword = (String)session.getAttribute("keyword");
		}
		
		//���ο� �����÷��� ���� �� ���, �Ʊ� �����Ѱ� �ִٸ�
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