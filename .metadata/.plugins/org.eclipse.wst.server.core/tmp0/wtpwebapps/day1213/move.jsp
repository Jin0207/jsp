<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String color = request.getParameter("color");
	out.print(color);
	String name = URLDecoder.decode(request.getParameter("name"));
%>
<body bgcolor="<%=color%>">
	move.jsp로 이동함
	<hr>
	이름: <%=name %>
</body>
</html>