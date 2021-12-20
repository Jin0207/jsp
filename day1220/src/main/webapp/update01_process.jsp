<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
	
	ResultSet rs = null;
	Statement stmt = null;
	try{
		String sql = "select id,passwd from member100 where id = '" + id +"'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			String rId = rs.getString("id");
			String rPasswd = rs.getString("passwd");
			if(id.equals(rId) && passwd.equals(rPasswd)){
				sql = "update member100 set name='"+name+"' where id = '"+id+"'";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				out.print("이름을 변경하였습니다.");
			}else{
				out.print("비밀번호를 잘못입력하셨습니다.");
			}
		}else{
			out.println("일치하는 아이디가 없습니다.");
		}
	}catch(Exception e){
		out.println("수정에 실패하였습니다.");
		out.println(e.getMessage());
	}finally{
		if(rs != null)rs.close();
		if(stmt != null) stmt.close();
		if(conn != null)conn.close();
	}
%>
</body>
</html>