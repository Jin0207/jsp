<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form02_process.jsp" method="post" enctype="multipart/form-data">
		<p>제목: <input type="text" name="title"></p>		
		<p>파일: <input type="file" name="fileName"></p>
		<p><input type="submit" value="확인"></p>		
	</form>
</body>
</html>