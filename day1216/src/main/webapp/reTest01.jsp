<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm() {
		//var regExp = new RegExp("Java", 'i');
		var regExp = /Java/i;
		var str = document.frm.title.value;
		/*var result = regExp.exec(str);
			console.log(result);
			alert(result[0]);
		*/
		var result = regExp.test(str);
		alert(result);
	}
</script>
</head>
<body>
	<form action="#" name="frm">
		제목: <input type="text" name="title">
		<input type="button" value="전송" onclick="checkForm()">
	</form>
</body>
</html>