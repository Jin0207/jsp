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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone1");
	phone += request.getParameter("phone2");
	phone += request.getParameter("phone3");
	String sex = request.getParameter("sex");
	String[] hobby = request.getParameterValues("hobby");
	String city = request.getParameter("city");
	String comment = request.getParameter("comment");
%>
<h3>개인정보</h3>
아이디: <%=id %><br>
비밀번호: <%=password %><br>
전화번호: <%=phone %><br>
성별: <%=sex %><br>
취미:
<%
	for(String s: hobby){
%>
	<%=s %>
<%		
	}
%>
<br>
거주지: <%=city %><br>
인사말: <%=comment %><br>
</body>
</html>