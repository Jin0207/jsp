<%@page import="com.sist.vo.Member"%>
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
	request.setCharacterEncoding("euc-kr");
/*
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	
	Member m = new Member(id,pwd,name,age,addr,phone);
*/
%>
<jsp:useBean id="m" class="com.sist.vo.Member" />
<jsp:setProperty property="*" name="m"/>
	입력한 회원의 정보는 다음과 같습니다.<hr>
	<%= m %>
</body>
</html>