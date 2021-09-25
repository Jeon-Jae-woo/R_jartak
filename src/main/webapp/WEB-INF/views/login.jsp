<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">

<style type="text/css">
	#loginBody{	
	    max-width: 0 auto;
	    margin: 0 auto;
	    margin-top: 10%;
	    margin-bottom:10%;
	    display: flex;
	   justify-content: space-evenly;
	}
	.loginForm h2 {
		text-align: center;
		margin: 30px;
	}
	
	.loginForm {
	width: 300px;
	height: 350px;
	padding: 30px, 20px;
	border: 1px solid;
	text-align: center;
	border-radius: 15px;
}
	
	.idForm {
		border-bottom: 2px solid #adadad;
		margin: 30px;
		padding: 10px 10px;
	}
	
	.passForm {
		border-bottom: 2px solid #adadad;
		margin: 30px;
		padding: 10px 10px;
	}
	
	.id {
		width: 100%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 16px;
		height: 25px;
		background: none;
	}
	
	.pw {
		width: 100%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 16px;
		height: 25px;
		background: none;
	}
	
	
	.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	font-weight: bold;
	border: none;
	cursor: pointer;
	display: inline;
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
				url:"login",
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
	<%@ include file="header.jsp" %>	
	<div id="loginBody">
		<div>
			<div id="login_Form">
				<div class="loginForm">
					<h2>Login</h2>
					<div class="idForm">
						<input type="text" class="id" placeholder="EMAIL" name="email" id="email">
					</div>
					<div class="passForm">
						<input type="password" class="pw" placeholder="PW" name="password" id="password">
					</div>
					<button type="button" class="btn" onclick="loginCheck();">LOGIN</button>
				</div>
			</div>
		</div>
	</div>
			
	<%@ include file="footer.jsp" %>
</body>
</html>