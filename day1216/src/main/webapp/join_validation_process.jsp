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
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String email = request.getParameter("email");
	%>
	입력정보는 다음과 같습니다.<hr>
	아이디: <%= id %><br>	
	비밀번호: <%= password %><br>	
	이름: <%= name %><br>	
	전화번호: <%= phone1 %>-<%=phone2 %>-<%=phone3 %><br>
	이메일: <%=email %>	
	<hr>
</body>
</html>