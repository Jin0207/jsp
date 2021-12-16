<%@page import="java.io.File"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sist.vo.GoodsVO"%>
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
		int no = Integer.parseInt(request.getParameter("no"));
		GoodsDAO dao = GoodsDAO.getInstance();
		String fname = dao.getGoods(no).getFname();
		String path = request.getRealPath("goods");
		int re = dao.delete(no);
		if(re==1){
			File file = new File(path + "/" + fname);
			file.delete();
			response.sendRedirect("listGoods.jsp");
		}else{
			out.println("상품삭제에 실패하였습니다.");
		}
	%>
</body>
</html>