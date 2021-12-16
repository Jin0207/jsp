<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	//MultipartRequest multi = new MultipartRequest(request, "c:/upload", 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
	
	String path = request.getRealPath("upload");
	MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*5, "UTF-8", new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String fileName = multi.getFilesystemName("fileName");
	out.println(path + "<br>");
	out.println("title: " + title);
	out.println("fileName: " + fileName);
%>
</body>
</html>