<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkMember() {
		var regExp_id = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var regExp_name = /^[가-힣]*$/;
		var regExp_password = /^[0-9]*$/;
		var regExp_phone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		var id = document.member.id.value;
		var password = document.member.password.value;
		var name = document.member.name.value;
		var phone = document.member.phone1.value + "-"
					+ document.member.phone2.value + "-"
					+ document.member.phone3.value;
		var email = document.member.email.value;
		
		if(!regExp_id.test(id)){
			alert("아이디는 문자로 시작해주세요.");
			document.member.id.focus();
			return false;
		}
		
		if(!regExp_name.test(name)){
			alert("이름은 한글만 입력해주세요");
			document.member.name.focus();
			return false;
		}
		
		if(!regExp_password.test(password)){
			alert("비밀번호는 숫자만 입력해주세요");
			document.member.password.focus();
			return false;
		}

		if(!regExp_phone.test(phone)){
			alert("전화번호 형식에 맞지 않습니다.");
			document.member.phone.focus();
			return false;
		}
		
		if(!regExp_email.test(email)){
			alert("이메일 형식에 맞지않습니다.");
			document.member.email.focus();
			return false;
		}
		
		document.member.submit();
		
	}
</script>
</head>
<body>
	<h2>회원 가입</h2>
	<form name="member" action="join_validation_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="password"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>연락처: 
			<input type="tel" name="phone1">
			-
			<input type="tel" name="phone2">
			-
			<input type="tel" name="phone3">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<input type="button" value="가입하기" onclick="checkMember()">
	</form>
</body>
</html>