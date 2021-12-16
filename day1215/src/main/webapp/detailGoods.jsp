<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	GoodsDAO dao = GoodsDAO.getInstance();
	GoodsVO vo = dao.getGoods(no);
%>
	<h2>상품 상세</h2>
	<hr>
	<p>상품번호: <%=vo.getNo() %></p>
	<p>상품이름: <%=vo.getName() %></p>
	<p>상품가격: <%=vo.getPrice() %></p>
	<p>상품수량: <%=vo.getQty() %></p>
	<img width="200" height="200" src="goods/<%=vo.getFname()%>">
	<hr>
	<a href="updateGoods.jsp?no=<%=vo.getNo() %>">수정</a>
	<a href="deleteGoods.jsp?no=<%=vo.getNo() %>">삭제</a>
</body>
</html>