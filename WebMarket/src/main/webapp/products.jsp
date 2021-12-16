<%@page import="com.sist.dao.ProductRepository"%>
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
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> list = dao.getAllProducts();
	%>
	
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(Product p:list){
					%>
						<div class="col-md-4">
							<img src="resources/images/<%=p.getFileName()%>" style="width:100%;">
							<h3><%= p.getPname() %> </h3>
							<p><%= p.getDescription() %> </p>
							<p><%= p.getUnitPrice() %>원 </p>
							<p><a role="button"  class="btn btn-secondary" href="product.jsp?id=<%=p.getProductId()%>">상세 정보 &raquo;</a>   </p>
						</div>
					<%	
				}			
			%>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>




