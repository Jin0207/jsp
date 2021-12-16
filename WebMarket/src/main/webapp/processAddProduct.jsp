<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sist.dao.ProductRepository"%>
<%@page import="javax.sound.sampled.Port"%>
<%@page import="com.sist.vo.Product"%>
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
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("resources/images");
	MultipartRequest multi = new MultipartRequest(
		request,
		path,
		1024*1024*5,
		"utf-8",
		new DefaultFileRenamePolicy()
	);
			
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	double unitPrice =  Double.parseDouble(multi.getParameter("unitPrice"));
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	int unitsInStock = Integer.parseInt(multi.getParameter("unitsInStock"));
	String condition = multi.getParameter("condition");
	String fileName = multi.getFilesystemName("productImage");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setPname(name);
	product.setUnitPrice(unitPrice);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitInStock(unitsInStock);
	product.setCondition(condition);
	product.setFileName(fileName);
	
	ProductRepository dao = ProductRepository.getInstance();
	dao.addProduct(product);
	response.sendRedirect("products.jsp");
%>
</body>
</html>










