<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function report(){
		//세션 및 디테일 페이지에서 유저 아이디를 얻어오고 넘겨줘야 함
		window.open("report.jsp", "신고", "width=500px, height=500px");
	}
</script>

</head>
<body>
	<h1>테스트</h1>
	<a href="test">홈테스트</a>
	<a href="test2">컨트롤러2 테스트</a>
	
	<button onclick="report();">신고하기</button>
	

</body>
</html>