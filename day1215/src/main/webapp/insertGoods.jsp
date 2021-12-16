<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 등록</h2>
	<form action="insertGoodsOK.jsp" method="post" enctype="multipart/form-data">
		<p>상품번호: <input type="number" name="no"></p>
		<p>상품명: <input type="text" name="name"></p>
		<p>상품가격: <input type="number" name="price"></p>
		<p>상품수량: <input type="number" name="qty"></p>
		<p>상품사진: <input type="file" name="fname"></p>
		<input type="submit" value="등록">
	</form>
</body>
</html>