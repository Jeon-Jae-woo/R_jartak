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
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>join</title>
<!-- daum 도로명 api -->
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
	
	
	$(document).ready(function() { 
	var address = $('#addressDetail');
	//email 중복확인
	
	$('form').on('submit',function(){
		var inval_Arr = new Array(8).fill(false);
		if(($('#password').val()==($('passwordVer').val()))
				&& pwJ.test($('password').val())){
			inval_Arr[1] = true;
		}else{
			inval_Arr[1] = false;
			alert('비밀번호를 입력하세요');
			return false;
		}
	//이름 정규식
	if(nameJ.test($('#name').val())){
		inval_Arr[2] = true;
		
	}else{
		inval_Arr[2] = false;
		alert('이름을 확인하세요');
		return false;
		
	}
	//생일 정규식
	if(birthJ){
		console.log(birthJ);
		inval_Arr[3] = true;
	}else{
		inval_Arr[3] = false;
		alert('생년월일을 확인하세요');
		return false;
		
	}
	//성별
	if(member.gender[0].checkde==false&&member.gender[1].checked==false){
		inval.Arr[4] = false;
		alert('성별을 확인하세요');
		return false;
	}else{
		inval_Arr[4] = true;
	}
	//주소 확인
	if(address.val() == ''){
		inval_val[5] = false;
		alert('주소를 확인하세요');
		return false;
	}else{
		inval_Arr[5] = true;
	
	
	//전체유효성
	var validAll =true;
	for(var i=0;i < inval_Arr.length;i++){
		validAll = false;
	}
	}
	if(validAll=true){
		alert('저희와 함께해주셔서 감사합니다');
	}else{
		alert('정보를 다시 확인하세요');
	}
	
	});
	
	//비밀번호 
	$('#password').blur(function(){
		if(pwJ.test($('#password').val())){
			console.log('true');
			$('#pw_check').text('');
		}else{
			console.log('false');
			$('#pw_check').text('4~12자의 숫자, 문자로만 사용 가능합니다');
			$('#pw_check').css('color','red');
		}
		
	});
	
	//비밀번호 일치 확인
	$('#passwordVer').blur(function(){
		if($('#password').val()!=$(this).val()){
			$('#pw2_check').text('비밀번호가 일치하지 않습니다');
			$('#pw2_check').css('color','red');
		}else{
			$('#pw2_check').text('');
		}
	});
	
	//이름에 특수문자x
	$('#name').blur(function(){
		if(nameJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$('#name_check').text('');
		}else{
			$('#name_check').text('한글2~4자 이내로 입력하세요 (특수기호, 공백 사용 불가)');
			$('#name_check').css('color','red');
		}
	});
	$('#email').blur(function(){
		if(mailJ.test($(this).val())){
			$('#email_check').text('');
		}else{
			$('#email_check').text('이메일 양식을 확인해주세요');
			$('#email_check').css('color','red');
		}
	});
	$("#email").blur(function(){
		if(mailJ.test($(this).val())){
			$("#email_check").text('');
		}else{
			$('#email_check').text('이메일 양식을 확인해주세요');
			$('#email_check').css('color','red');
		}
	});
	
	//생일 유효성 검사
	var birthJ = false;
	
	//생년월일 유요성검사
	$('#birth').blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4));//년도0~4자리까지
		var month = Number(dateStr.substr(4,2));//4에서 2자리 (월)
		var day = Number(dateStr.substr(6,2)); //6에서 2자리 (일)
		var today = new Date();//날짜 변수 선언
		var yearNow = todat.FullYear(); //올해 연도 
		
		if(dateStr.length <= 8){
			if(year>yearNow || year<1900){
				
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color','red');
			}
			else if(month<1 ||month>12){
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color','red');
			}else if(day <1 || day > 31){
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color','red');
			}else if((month==4||month==6||month==9||month==11)&&day==31)			
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color','red');
			}else if(month==2){
				var ispleap = (year%4 == 0 && (year%100!=0||year%400==0));
			
				if(day>29 || (day==29&&!ispeap)){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color','red');
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}
			}else{
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color','red');
			}
			
			$('phone').blur(function(){
				if(phoneJ.test($(this).val())){
					console.log(nameJ.test($(this).val()));
					$("phone_check").text('');
				}else{
					$('#phone_check').text('휴대폰번호를 확인해주세요');
					$('#phone_check').css('color','red');
				}
			});
		
	});
	
	function execPostCode(){
		new daum.Postcode({
			oncompleat: function(data){
				var fullRoadAddr = data.roadAddress;
				var extraRoadAddr = '';
				
				if(data.bname !== '' && /[동/로/가]$/g.test(data.bname)){
					extraRoadAddr += data.bname;
				}
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraRoadAddr +=(extraRoadAddr !== '' ? ','+data.buildingName : data.buildingName);
				}
				if(fullRoadAddr !== ''){
					fullRoadAddr += extraRoadAddr;
				}
				
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				
				$("[name=oddress]").val(data.zonecode);
				$("[name=address]").val(fullRoadAddr);
				
				document.getElementById('oaddress').value = data.zonecode;
				document.getElementById('address').value = fullRoadAddr;
				
			}
		}).open();
	}
	
	
	
	
	});


</script>

</head>
<body>
	<%@ include file="header.jsp" %>	
	
	<div id="joinBody">
		<div>
			<form action="join.do" id="usercheck" name="member" method="post">
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