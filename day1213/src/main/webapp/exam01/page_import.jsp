<!-- 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
 -->
<%@page import="java.util.Date, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList list = new ArrayList();
	list.add("사과");
	list.add("수박");
%>
	Today is <%= new Date() %> <br>
	Today is <%= new java.util.Date() %> <br>
	 과일 리스트 <%= list %>
</body>
</html>