<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="inputMemberOK.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		암호: <input type="password" name="pwd"><br>
		이름: <input type="text" name="name"><br>
		나이: <input type="number" name="age"><br>
		주소: <input type="text" name="addr"><br>
		전화번호: <input type="tel" name="phone"><br>
		<input type="submit" value="확인">
	</form>
	
</body>
</html>