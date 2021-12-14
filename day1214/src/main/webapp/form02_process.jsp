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
%>
<jsp:useBean id="member" class="com.sist.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<h3>개인정보</h3>
아이디: <%=member.getId() %><br>
비밀번호: <%=member.getPassword() %><br>
전화번호: <%= member.getPhone1()  %> - <%= member.getPhone2() %> - <%= member.getPhone3() %><br>
성별: <%=member.getSex() %><br>
취미:
<%
	if(member.getHobby()!=null){
		for(String m: member.getHobby()){
			out.print(m+" ");
		}
	}
%>
<br>
거주지: <%=member.getCity() %><br>
인사말: <%=member.getComment() %><br>
</body>
</html>