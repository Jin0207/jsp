<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	body{
		width: 80%;
	}
	table, td, th{
		border: 1px solid black;
		text-align: center;
	}
	table{
		border-collapse: collapse;
		width: 100%;
	}
	.title{
		background: darkgray;
		color:white;
	}
	.btn{
		display: flex;
		justify-content: space-between;
	}
</style>
</head>
<body>
	<%
		int[] lastDate = {31,28,31,30,31,30,31,31,30,31,30,31};
		String[] days = {"일","월","화","수","목","금","토"};
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();
		
		if(request.getParameter("month")!=null){
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			
			if(month == 12){
				year ++;
				month=0;
			}
			if(month==-1){
				year--;
				month=11;
			}
		}
		
		Date day = new Date(year,month,1);
		int firstDay = day.getDay();
	%>
	<table>
		<caption> <%=year +1900%>년 <%=month+1 %>월</caption>
		<tr class="title">
			<%
				for(String d: days){
			%>
					<th><%=d %></th>
			<%
				}
			%>
		</tr>
		<tr>
			<%
				for(int i=1; i <= firstDay; i++){
			%>	
					<td>&nbsp;</td>
			<%		
				}
				for(int i=1; i<= lastDate[month]; i++){
			%>
						<td><%=i %></td>
						<%
						if( (i+firstDay) % 7 ==0){
						%>
								</tr><tr>
						<%
						}
				}
			%>
		</tr>
	</table>
	<hr>
	<div class="btn">
	<a href="calendarTest.jsp?year=<%=year %>&month=<%=month-1%>">이전달</a>
	<a href="calendarTest.jsp?year=<%=year %>&month=<%=month+1%>">다음달</a>
	</div>
</body>
</html>