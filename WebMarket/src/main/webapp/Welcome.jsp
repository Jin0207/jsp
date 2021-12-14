<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style type="text/css">
  	.box{
  		text-align: center;
  	}
  </style>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<%!
		String greeting = "Welcome to Web Shopping Mall";
		String tagline = "Welcome to Web Market!";
	%>

	<div class="box">
		<div class="jumbotron" >
			<h1><%=greeting %></h1>
		</div>
		<h3><%=tagline %></h3>
		<%
			response.setIntHeader("Refresh", 5);
			Date day = new Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if(hour / 12 == 0){
				am_pm = "AM";
			}else{
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute+":"+second+" "+am_pm;
			out.print("현재 접속 시각:" + CT + "<br>");
		%>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>




