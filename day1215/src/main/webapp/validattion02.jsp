<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm(){
		var id = document.loginForm.id.value;
		var password = document.loginForm.password.value;
		if(id==""){
			alert("아이디를 입력해주세요");
			document.loginForm.id.focus();
			return false;
		}
		if(password==""){
			alert("비밀번호를 입력해주세요");
			document.loginForm.password.focus();
			return false;
		}
		document.loginForm.submit();
	}
</script>
</head>
<body>
	<form action="validattion02_process.jsp" method="post" name="loginForm">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="password"></p>
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>