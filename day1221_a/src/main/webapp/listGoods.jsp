<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 목록</h2>
	<table border="1" width="60%">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="g" items="${list }">
			<tr>
				<td>${g.no}</td>
				<td>
					<a href="detailGoods.do?no=${g.no }">${g.name }</a>
				</td>
				<td>${g.price }</td>
			</tr>			
		</c:forEach>
	</table>
</body>
</html>