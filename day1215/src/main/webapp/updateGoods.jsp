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
		int no = Integer.parseInt( request.getParameter("no"));
		GoodsDAO dao = GoodsDAO.getInstance();
		GoodsVO g = dao.getGoods(no);
	%>
	<h2>상품수정</h2>
	<hr>
	<form action="updateGoodsOK.jsp" method="post" enctype="multipart/form-data">
		<p><input type="hidden" name="no" value="<%= g.getNo()%>"></p>
		<p>상품명: <input type="text" name="name" value="<%=g.getName()%>"></p>
		<p>상품가격: <input type="number" name="price" value="<%=g.getPrice()%>"></p>
		<p>상품수량: <input type="number" name="qty" value="<%=g.getQty()%>"></p>
		<img width="30" height="30" src="goods/<%=g.getFname()%>"><br>
		<input type="hidden" name="fname" value="<%=g.getFname() %>">
		<p>상품사진 파일명: <input type="file" name="uploadFile" ></p>
		<input type="submit" value="수정">
	</form>
</body>
</html>