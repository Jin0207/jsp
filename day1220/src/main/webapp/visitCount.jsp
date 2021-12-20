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
		int visitCount = 0;
		Cookie[] cookies =  request.getCookies();
		if(cookies != null){
			for(Cookie cookie :cookies){
				String name = cookie.getName();
				if(name.equals("visitCount")){
					visitCount = Integer.parseInt(cookie.getValue());
				}
			}
		}
		visitCount++;
	%>
	<%= visitCount %>번째 방문입니다.
	<%
		Cookie cookie = new Cookie("visitCount", visitCount + "");
		response.addCookie(cookie);
	%>
</body>
</html>