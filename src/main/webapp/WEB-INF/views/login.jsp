<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>
	<%@ include file="header.jsp" %>	
	<div id="loginBody">
		<div>
			<form action="" method="post">
				<div class="loginForm">
					<h2>Login</h2>
					<div class="idForm">
						<input type="text" class="id" placeholder="EMAIL" name="email">
					</div>
					<div class="passForm">
						<input type="password" class="pw" placeholder="PW" name="password">
					</div>
					<button type="submit" class="btn" onclick="">LOGIN</button>
				</div>
			</form>
		</div>
	</div>
			
	<%@ include file="footer.jsp" %>
</body>
</html>