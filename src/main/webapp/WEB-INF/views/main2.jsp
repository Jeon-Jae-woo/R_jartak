<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<!-- <link href="resources/css/main2.css" rel="stylesheet"/> -->
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

<style>
	.banner {
    width: 100%;
    height: 400px;
    /* background-color: rgb(211, 211, 211); */
    text-align: center;
}

	.banner-image {
	    height: 100%;
	}
</style>
<script type="text/javascript">
	function loginCheck(){
		console.log("[LOGIN]");
	
	var email = $("#email").val().trim();
	var password = $("#password").val().trim();
	
	var loginInfo = {
			"email":email,
			"password":password
	};
	
	if(email==""||email==null||password==""||password==null){
		alert("아이디 혹은 비밀번호를 입력해 주세요");
		
	}else{
		$.ajax({
			type:"POST",
			url:"afterlogin.do",
			data:JSON.stringify(loginInfo),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log(data.status_code);
				if(data.status_code=='UNAUTHORIZED'){
					alert("아이디 혹은 비밀번호를 잘못 입력했습니다");
				}else if(data.status_code=='OK'){
					location.href='main2.do';
				}
			},
			error:function(){
				alert("서버 에러");
			}
		});
	}
	
	
}

</script>


</head>
<body>

<%@ include file="header.jsp"  %> 

    <div class="banner">
        <image class="banner-image" src="resources/images/banner2.png" alt="banner"></image>
    </div>
	

<!-- 
<div class="notice">
	<ul class="board">
		<li class="fl tc w500 title t_line"><a href="">[공지]21일 서버점검완료</a><span>/2021-09-21</span></li>
	</ul>
	<ul class="board">
		<li class="fl tc w500 title t_line"><a href="">[공지]마감임박경매 관련공지</a><span>/2021-09-11</span></li>
	</ul>
	<ul class="board">
		<li class="fl tc w500 title t_line"><a href="">[공지]불량이용자 제재내역</a><span>/2021-09-01</span></li>
	</ul>
	<ul class="board">
		<li class="fl tc w500 title t_line"><a href="">[공지]이용안내</a><span>/2021-08-27</span></li>
	</ul>
	<ul class="board">
		<li class="fl tc w500 title t_line"><a href="">[공지]경매등록시 안내</a><span>/2021-08-24</span></li>
	</ul>
</div> -->
	
	
	
<%@ include file="footer.jsp"  %> 
</body>
</html>