<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 상세</h2>
	<hr>
	글번호: ${b.no }<br>
	글제목: ${b.title }<br>
	작성자: ${b.writer }<br>
	등록일: ${b.regdate }<br>
	조회수: ${b.hit }<br>
	글내용: <br>
	<textarea rows="10" cols="20" readonly="readonly">${b.content }</textarea> <br>
	이미지파일명: ${b.fname }(${b.fsize }bytes)<br>
	<hr>
	<a href="updateBoard.do?no=${b.no }">수정</a>	
	<a href="deleteBoard.do?no=${b.no }">삭제</a>	
</body>
</html>