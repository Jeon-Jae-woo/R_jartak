<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
	#joinBody{		
	   max-width: 0 auto;
	   margin: 0 auto;
	   margin-top: 10%;
	   margin-bottom:10%;
	   display: flex;
	   justify-content: space-evenly;
	}

	.loginForm {
		width: 700px;
		height: 700px;
		padding: 30px, 20px;
		border: 1px solid;
		text-align: center;
		border-radius: 15px;
		}
	
	.divForm {
		display:flex;
		padding: 10px 10px 10px 10px;
		margin:10px 10px 10px 10px;
	}
	
	.input_form {
		width: 50%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 15px;
		height: 25px;
		border-bottom:1px solid;
	}
	.input_form:valid{
		background: none;
	}
	
	.birth_form{
		width:15%;
		border: none;
		outline: none;
		color:#636e72;
		font-size: 15px;
		height: 25px
		background: none;
		border-bottom:1px solid;
	}
	
	.btn {
		position: relative;
		
		left: 45%;
		transform: translateX(-50%);
		margin-bottom: 40px;
		margin-top:20px;
		width: 60%;
		height: 40px;
		font-weight: bold;
		border: none;
		cursor: pointer;
		display: inline;
	}

	#joinForm{
		display:flex;
		flex-direction: column;
		align-item: center;
		justify-content: center;
	}
	
	.divForm label, input{
		margin-left:20px;
	}
	
	.formLabel{
		font-size:14px;
		padding-top:4px;
	}
	
	
</style>
<script type="text/javascript">
	//모든 공백 체크 정규식 
	var empJ = /\s/g; 
	//아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
	// 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	// 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
				 /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/ 
	
	var birthJ = false; 
	
	var address = $('#addressDetail');
	
	//id 중복확인
	$(document).ready(function() { 
	var address = $('#addressDetail');
	
	
	
	});





</script>

</head>
<body>
	<%@ include file="header.jsp" %>	
	
	<div id="joinBody">
		<div>
			<form action="" method="post">
				<div class="loginForm">
					<h2>회원가입</h2>
					<div id="">
					<div class="divForm">
						<label for="email" class="formLabel" style="margin-right:47px;">이메일</label>
						<input type="text" id="email" class="input_form" placeholder="EMAIL" name="email">
						<input type="button" value="중복확인">
						<div class="eheck_font" id="email_check"></div>
					</div>
					<div class="divForm">
						<label for="password" class="formLabel" style="margin-right:32px;">비밀번호</label>
						<input type="password" id="password" class="input_form" placeholder="PASSWORD" name="password">
						<div class="eheck_font" id="pw_check"></div>
					</div>
					<div class="divForm">
						<label for="passwordVer" class="formLabel">비밀번호 확인</label>
						<input type="password" id="passwordVer" class="input_form" placeholder="PASSWORD" name="passwordVer">
						<div class="eheck_font" id="pw2_check"></div>
					</div>
					<div class="divForm">
						<label for="nickname" class="formLabel" style="margin-right:47px;">닉네임</label>
						<input type="text" id="nickname" class="input_form" placeholder="NICKNAME" name="nickname">
						<input type="button" value="중복확인">
						<div class="eheck_font" id="nick_check"></div>
					</div>
					<div class="divForm">
						<label for="name" class="formLabel" style="margin-right:59px;">이름</label>
						<input type="text" id="name" class="input_form" placeholder="NAME" name="nickname">
						<div class="eheck_font" id="name_check"></div>
					</div>
					<div class="divForm">
						<label for="year" class="formLabel" style="margin-right:30px;">생년월일</label>
						<input type="text" class="birth_form" id="year" placeholder="YEAR" name="year">
						<input type="text" class="birth_form" id="month" placeholder="MONTH" name="month">
						<input type="text" class="birth_form" id="day" placeholder="DAY" name="day">
						<div class="eheck_font" id="birth_check"></div>
					</div>
					<div class="divForm">
						<label for="gender" class="formLabel" style="margin-right:59px;">성별</label>
						<div style="dislay:flex;">
						<input type="radio" class="radio" name="gender" value="남자">남자
						<input type="radio" class="radio" name="gender" value="남자">여자
						</div>
						<div class="eheck_font" id="gender_check"></div>
					</div>
					<div class="divForm">
						<label for="address" class="formLabel" style="margin-right:59px;">주소</label>
						<input type="text" id="address" class="input_form" placeholder="ADDRESS" name="address" readonly="readonly">
						<input type="button" value="주소검색">
						<div class="eheck_font" id="addr_check"></div>
					</div>
					<div class="divForm">
						<label for="addressDetail" class="formLabel" style="margin-right:30px;">상세주소</label>
						<input type="text" id="addressDetail" class="input_form" placeholder="ADDRESS DETAIL" name="addressDetail">
					</div>
					<div class="divForm">
						<input type="submit" class="btn" onclick="" value="회원가입">
					</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	
	
	<%@ include file="footer.jsp" %>	
</body>
</html>