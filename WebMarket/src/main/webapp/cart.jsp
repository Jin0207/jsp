<%@page import="com.sist.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		String cartId = session.getId();
	%>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron" >
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a class="btn btn-danger" href="./deleteCart.jsp?cartId=<%=cartId%>">삭제</a>
					</td>
					<td align="right">
						<a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum=0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartList");
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					for(int i = 0; i<cartList.size(); i++){
						Product product = cartList.get(i);
						int total = (int)product.getUnitPrice() * product.getQuantity();
						sum += total;
						%>
						<tr>
							<td><%= product.getProductId()%> - <%= product.getPname() %></td>
							<td><%= product.getUnitPrice()%></td>
							<td><%= product.getQuantity()%></td>
							<td><%= total%></td>
							<td>
								<a href="./removeCart.jsp?id=<%=product.getProductId()%>">삭제</a>
							</td>
						</tr>
						<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %></th>
					<th></th>
				</tr>
			</table>
			<a href="./products.jsp" class="btn btn-secondary">&laquo; 쇼핑계속하기</a>
		</div>
		<hr>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>




