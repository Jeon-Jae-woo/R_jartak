<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function webRTC(){
		//room name은 경매 번호로 지정
		window.open("http://ec2-13-124-233-131.ap-northeast-2.compute.amazonaws.com:3000?room1","web", "width=1000px, height=500px");
	}
</script>



</head>
<body>
	
	<a href="main2.do">메인2테스트</a>
	
	
	<a href="mypage.do?">마이페이지</a>


	<button onclick="webRTC();">webRTC테스트</button>
	
	
	<a href="join.do?">회원가입</a>

</body>
</html>