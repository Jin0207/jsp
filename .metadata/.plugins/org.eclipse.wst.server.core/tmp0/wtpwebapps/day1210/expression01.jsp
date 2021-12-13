<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>
		Today`s date:
		<%= new Date()%>
	</p>
	<hr>
	<%
		Date today = new Date();
		int year = today.getYear()+1900;
	%>
	<%= today %><br>
	<%= year %>
</body>
</html>