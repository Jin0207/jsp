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
	<table width="300" border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%
			String sql = "select * from member100";
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					String id = rs.getString(1);
					String pwd = rs.getString(2);
					String name = rs.getString(3);
					%>
					<tr>
						<td><%= id%></td>
						<td><%= pwd%></td>
						<td><%= name%></td>
					</tr>
					<%
				}
			}catch(Exception e){
				out.print("예외발생");
				out.print(e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn !=null)conn.close();
			}
		%>
	</table>
</body>
</html>