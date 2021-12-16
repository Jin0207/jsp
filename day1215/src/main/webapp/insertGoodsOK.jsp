<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String path = request.getRealPath("goods");
	System.out.print(path);
	MultipartRequest multi = new MultipartRequest(request,path,1024*1024*5,"UTF-8", new DefaultFileRenamePolicy());
	
	GoodsVO vo = new GoodsVO();
	vo.setNo(Integer.parseInt(multi.getParameter("no")));
	vo.setName(multi.getParameter("name"));
	vo.setPrice(Integer.parseInt(multi.getParameter("price")));
	vo.setQty(Integer.parseInt(multi.getParameter("qty")));
	vo.setFname(multi.getFilesystemName("fname"));
	
	GoodsDAO dao = GoodsDAO.getInstance();
	int re = dao.insert(vo);
	if(re == 1){
		response.sendRedirect("listGoods.jsp");
	}else{
		out.print("상품등록 실패!");
	}
%>
</body>
</html>