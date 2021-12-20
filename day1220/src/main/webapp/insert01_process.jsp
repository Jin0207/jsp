<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	
	Statement stmt = null;
	try{
		String sql = "insert into member100(id,passwd,name) values('"+id+"','"+passwd+"','"+name+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		out.print("레코드를 추가하였습니다.");
	}catch(Exception e){
		out.print("레코드 추가에 실패하였습니다.");
		out.print(e.getMessage());
	}finally{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
%>
</body>
</html>