<%@page import="com.sist.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
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
	<jsp:useBean id="dao" class="com.sist.dao.ProductRepository"/>
	<%
		ArrayList<ProductVO> list = dao.getAllProducts();
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
				for(ProductVO p : list){
			%>
				<div class="col-md-4">
					<h3><%= p.getPname() %></h3>
					<p><%= p.getDescription() %></p>
					<p><%= p.getUnitPrice() %>원</p>
					<p><a role="button" class="btn btn-secondary" href="product.jsp?id=<%=p.getProductId()%>">상세정보 &raquo;</a></p>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>