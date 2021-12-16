
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="java.util.ArrayList"%>
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
	GoodsDAO dao = GoodsDAO.getInstance();
	ArrayList<GoodsVO> list = dao.listAll();
%>
	<h2>상품 목록</h2>
	<hr>
	<a href=" insertGoods.jsp">상품등록</a>
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품이름</th>
		</tr>
		<% 
			for(GoodsVO vo : list){
		%>
			<tr>
				<td><%=vo.getNo() %></td>
				<td><a href="detailGoods.jsp?no=<%=vo.getNo()%>"><%=vo.getName() %></a></td>
			</tr>
		<%	
			}
		%>
		
	</table>
</body>
</html>