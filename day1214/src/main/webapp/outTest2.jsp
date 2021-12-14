<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	<%
		String[] list = {"홍길동","유관순","이순신"};
		for(String name : list){
			out.println("<li>" + name + "</li>");
		}
	%>
	</ul>
</body>
</html>