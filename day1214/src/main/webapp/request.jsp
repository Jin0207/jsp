<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h3>POST방식: 주소표시줄에 값이 노출되지않음</h3>
	<form action="process.jsp" method="post">
		이름: <input type="text" name="name">
		<input type="submit" value="전송">
	</form>
	<hr>
	<h3>GET방식: 주소표시줄에 값이 노출됨</h3>
	<form action="process.jsp">
		이름: <input type="text" name="name">
		<input type="submit" value="전송">
	</form>
	<hr>
	<a href="process.jsp?name=홍길동">연결</a>
</body>
</html>