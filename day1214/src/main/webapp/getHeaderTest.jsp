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
	String hostName = request.getHeader("host");
	String alvalue = request.getHeader("accept-lanaguage");
%>
	호스트명 : <%= hostName %><br>
	설정된언어: <%= alvalue %><br>
</body>
</html>