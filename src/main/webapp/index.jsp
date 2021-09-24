
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function report(){
		//세션 및 디테일 페이지에서 유저 아이디를 얻어오고 넘겨줘야 함, controller로 처리되도록 수정 필요
		window.open("reportForm.log", "신고", "width=500px, height=500px");
	}
	
	$(document).ready(function(){
		location.href="main2.do"
	});
	
	
</script>

</head>
<body>
	<h1>테스트</h1>
	<a href="test">홈테스트</a>
	<a href="test2">컨트롤러2 테스트</a>

	<button onclick="report();">신고하기</button>
	

	<a href="main3.do">메인3테스트</a>
	<a href="main2.do">메인2테스트</a>
	
	
	<a href="admin">헤더테스트</a>
	
	<a href="adminForm">관리자페이지</a>

	<a href="product.do">경매테스트</a>
	
	<a href="productAddForm.log">경매등록테스트</a>

	<a href="productlist">리스트페이지테스트</a>


	<a href="streaming.do">스트리밍페이지테스트</a>
	
	
	<a href="dateTest">테스트경매날짜</a>


	<a href="mypage.do?email=kh@kh.co.kr">마이페이지</a>
	
	<a href="message_test.do">메시지 테스트</a>

	<a href="mypage.do?">마이페이지</a>



	
	

	<a href="join.do?">회원가입</a>

</body>
</html>