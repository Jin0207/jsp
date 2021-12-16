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
		//아이디는 영문이거나 숫자여야한다.
		for(i=0; i<id.length; i++){
			var ch = id.charAt(i);
			if(ch < 'a'|| ch > 'z'){
				alert("아이디는 모두 영문 소문자로 입력해야합니다.");
				document.loginForm.id.select();
				return false;
			}
		}
		//비밀번호는 숫자만 입력가능하다
		if( isNaN(password) ){
			alert("비밀번호는 숫자만 입력가능합니다.");
			document.loginForm.password.select();
			return false;
		}
		
		document.loginForm.submit();
	}
</script>
</head>
<body>
	<form action="validattion03_process.jsp" method="post" name="loginForm">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="password"></p>
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>