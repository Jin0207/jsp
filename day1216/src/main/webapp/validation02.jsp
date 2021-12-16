<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkForm() {
		var name = document.f.name.value;
		//value가 없으면 태그(노드)자체를 , value가 있으면 값을 변수에 저장
		if( !isNaN( name.substr(0,1) )){
			alert("이름은 숫자로 시작할 수 없습니다.");
			document.f.name.select();
			return false;
		}
		document.f.submit();
	}
</script>
</head>
<body>
	<form name="f" action="validation02_process.jsp" method="post">
		<p>이름: <input type="text" name="name"></p>
		<input type="button" value="전송" onclick="checkForm()">
	</form>
</body>
</html>