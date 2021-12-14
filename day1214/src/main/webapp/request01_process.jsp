<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"/>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		//String[] hobby=request.getParameterValues("hobby");
		if(dao.isMember(id, password)){
			response.sendRedirect("response01_success.jsp");
		}else{
			response.sendRedirect("response01_failed.jsp");
		}
	%>
	<p>아이디: <%= id %></p>
	<p>비밀번호: <%= password %></p>
	<!-- 
	 취미:
	 	for(String h: hobby){
	 		out.println(h + "");
	 	}
	 %>
	  -->
</body>
</html>