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
	String name = request.getParameter("name");
	//get방식인 post방식인지 파악하기위한 메소드
	String method = request.getMethod();
	//요청정보길이를 가져오는 메소드
	int contentLength = request.getContentLength();
	String uri = request.getRequestURI();
	StringBuffer url = request.getRequestURL();
	String serverName = request.getServerName();
	int port = request.getServerPort();
	String ip = request.getRemoteAddr();
%>
이름: <%= name %><br>
요청방식확인 : <%= method %><br>
요청정보길이: <%=contentLength %><br>
요청 uri: <%=uri %><br>
요청 url: <%=url %><br>
서버이름: <%=serverName %><br>
ip주소: <%=ip %>
포트번호: <%=port %>

</body>
</html>