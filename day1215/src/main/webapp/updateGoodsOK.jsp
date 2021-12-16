<%@page import="java.io.File"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.sist.vo.GoodsVO"%>
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
	String path = request.getRealPath("goods");
	request.setCharacterEncoding("UTF-8");
	MultipartRequest multi = new MultipartRequest(request, path, 1021*1024*5, "UTF-8", new DefaultFileRenamePolicy());
	
	GoodsVO vo = new GoodsVO();
	String oldFname = multi.getParameter("fname");
	vo.setNo(Integer.parseInt(multi.getParameter("no")));
	vo.setName(multi.getParameter("name"));
	vo.setPrice(Integer.parseInt(multi.getParameter("price")));
	vo.setQty(Integer.parseInt(multi.getParameter("qty")));
	vo.setFname(oldFname);
	String fname = multi.getFilesystemName("uploadFile");
	
	if(fname != null && !fname.equals("")){
		vo.setFname(fname);
	}
	
	GoodsDAO dao = GoodsDAO.getInstance();
	int re = dao.update(vo);
	if(re == 1){
		if(fname != null && !fname.equals("")){
			File file = new File(path + "/" + oldFname);
			file.delete();
		}
		response.sendRedirect("listGoods.jsp");
	}else{
		out.print("상품수정 실패!");
	}
%>
</body>
</html>