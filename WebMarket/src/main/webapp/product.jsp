<%@page import="com.sist.dao.ProductRepository"%>
<%@page import="com.sist.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
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
	<script type="text/javascript">
		function addToCart(){
			 if(confirm("상품을 장바구니에 추가하시겠습니까?")){
				document.addForm.submit();	 
			 }
		}
	</script>	
</head>
<body>

	<%
		ProductRepository dao = ProductRepository.getInstance();
		String id = request.getParameter("id");
		Product product = dao.getProdutById(id);
	%>
	
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=product.getFileName()%>" style="width:100%;">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><b>상품코드</b> : <span class="badge badge-danger"><%=product.getProductId() %></span></p>
				<p><b>제조사</b> : <%=product.getManufacturer() %></p>
				<p><b>분류</b> : <%=product.getCategory() %></p>
				<p><b>재고 수량</b> : <%=product.getUnitInStock() %></p>
				<h3><%= product.getUnitPrice() %>원</h3>
				
				<div>
					<form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>




