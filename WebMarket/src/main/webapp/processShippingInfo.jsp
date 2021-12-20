<%@page import="java.net.URLEncoder"%>
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
	
		Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode( request.getParameter("cartId"), "UTF-8"));
		Cookie name = new Cookie("Shipping_name", URLEncoder.encode( request.getParameter("name"), "UTF-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode( request.getParameter("shippingDate"), "UTF-8"));
		Cookie country = new Cookie("Shipping_country", URLEncoder.encode( request.getParameter("country"), "UTF-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode( request.getParameter("zipCode"), "UTF-8"));
		Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode( request.getParameter("addressName"), "UTF-8"));
		
		//쿠키의 유효시간을 하루(24시간)
		cartId.setMaxAge(60*60*24);
		name.setMaxAge(60*60*24);
		shippingDate.setMaxAge(60*60*24);
		country.setMaxAge(60*60*24);
		zipCode.setMaxAge(60*60*24);
		addressName.setMaxAge(60*60*24);
		
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		
		response.sendRedirect("orderConfirmation.jsp");
	%>
</body>
</html>