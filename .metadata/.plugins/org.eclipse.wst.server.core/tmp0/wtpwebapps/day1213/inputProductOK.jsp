<%@page import="com.sist.dao.ProductDAO"%>
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
	%>
	<jsp:useBean id="product" class="com.sist.vo.Product"/>
	<jsp:useBean id="dao" class="com.sist.dao.ProductDAO"/>
	<jsp:setProperty property="*" name="product"/>
	등록한 상품정보는 다음과 같습니다.<br>
	<%=product %>
	<%
		int re = dao.insertProduct(product);
		if(re == 1){
			System.out.print("성공");
		}else{
			System.out.print("실패");	
		}
	%>
</body>
</html>