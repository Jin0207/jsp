<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm() {
		var regExp = /^[a-z|A-Z|ㄱ-ㅎ|가-힣|ㅏ-ㅣ]/
		var name = document.frm.name.value;
		if(!regExp.test(name)){
			alert("이름은 문자로 시작해야합니다.");
			return false;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
	<form name="frm" action="reTest02_process.jsp" method="post">
		이름: <input type="text" name="name">
		<input type="button" value="전송" onclick="checkForm()"> 	
	</form>
</body>
</html>