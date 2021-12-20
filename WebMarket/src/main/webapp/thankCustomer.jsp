<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
	<%
		String shipping_cartId = "";
		String shipping_shippingDate = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie: cookies){
				String n = cookie.getName();
				String value = URLDecoder.decode(cookie.getValue());
				
				if(n.equals("Shipping_cartId")){
					shipping_cartId = value;
				}
				else if(n.equals("Shipping_shippingDate")){
					shipping_shippingDate = value;
				}
			}
		}
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1>주문완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=shipping_shippingDate %>에 배송될 예정입니다.!</p>
		<p>주문번호: <%= shipping_cartId %></p>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">상품목록</a></p>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		session.invalidate();
	
	if(cookies != null){
		for(Cookie cookie :cookies){
			String n = cookie.getName();
			
			if(n.equals("Shipping_cartId")){
				cookie.setMaxAge(0);
			}
			if(n.equals("Shipping_name")){
				cookie.setMaxAge(0);
			}
			if(n.equals("Shipping_shippingDate")){
				cookie.setMaxAge(0);
			}
			if(n.equals("Shipping_country")){
				cookie.setMaxAge(0);
			}
			if(n.equals("Shipping_zipCode")){
				cookie.setMaxAge(0);
			}
			if(n.equals("Shipping_addressName")){
				cookie.setMaxAge(0);
			}
			
			response.addCookie(cookie);
		}
	}
%>
	%>
</body>
</html>