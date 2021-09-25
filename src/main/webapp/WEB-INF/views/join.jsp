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

<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<!-- daum 도로명 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	   text-decoration: left;
	}

	.loginForm {
		width: 700px;
		height: 800px;
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
		width: 70%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 15px;
		height: 25px;
		border-bottom:1px solid;
	}
	.address1{
		width : 20%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 15px;
		height: 25px;
		border-bottom:1px solid;
	}
	.address2{
		width : 40%;
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
	.mail_check_input{
		margin: 0;
		width: 98%;
		border: none;
		outline: none;
		color: #636e72;
		font-size: 15px;
		height: 25px;
		border-bottom:1px solid;
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
	.eheck_font{
		font-size: 5pt;
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
	
	#mail_check_input_box_false{
		margin-left: 20px;
		background-color: gray;
	}
	
	#mail_check_input_box_true{
		margin-left: 20px;
		background-color: white;
	}
	
	.correct{
		color : green;
	}
	.incorrect{
		color : red;
	}
	.mail_check_button{
		border: 1px solid black;
	}
	
</style>
<script type="text/javascript">

	var code = "";
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
	
	/*var address = $('.address1');*/
	
	
	
	
	$(document).ready(function() { 
	var address = $('#addressDetail');
	
	
	
	
	
	$('form').on('submit',function(){
		var inval_Arr = new Array(8).fill(false);
		if(($('#password').val()==($('#passwordVer').val()))
				&& pwJ.test($('#password').val())){
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
			$('#name_check').text('한글2~4자 이내로 입력하세요(특수기호, 공백 사용 불가)');
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
	
	
	
	
	
	
	});
	
	$(document).on('click','.mail_check_button',function(){
		var email = $("#email").val();
		var checkBox = $(".mail_check_input");
		var boxWrap = $(".mail_check_input_box");
		
		$.ajax({
	        
	        type:"GET",
	        url:"mailCheck.do?email=" + email,
	        success:function(data){
	            
	            //console.log("data : " + data);
	            checkBox.attr("disabled",false);
	            boxWrap.attr("id","mail_check_input_box_true");
	        	code = data;
	        }
		});
	
	});

	$(document).on('blur','.mail_check_input',function(){
		var inputCode = $(".mail_check_input").val();
		var checkResult = $("#mail_check_input_box_warn");
		
		 if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    
	});

	
	
	
	

	
	
</script>

</head>
<body>
	<%@ include file="header.jsp" %>	
	
	<div id="joinBody">
		<div>
			<form action="join"  method="get">
				<div class="loginForm">
					<h2>회원가입</h2>
					<div id="">
					<div class="divForm">
						<div style="width: 500px;">
						<label for="email" class="formLabel" style="margin-right:47px;">이메일</label>
						
						<input type="text" id="email" class="input_form" placeholder="EMAIL" name="email">
						<div class="eheck_font" id="email_check"></div>
						</div>
						
							<div class="mail_check_button">
								<span>인증번호 전송</span>
							</div>
							<div class="mail_input_box_warn">
						</div>
						
					</div>
					
					<div class="divForm">
						
						<label for="emailcheckVer" class="formLabel" style="margin-right:25px;">이메일 확인</label>
						<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input type="text" id="email_check" class="mail_check_input" placeholder="EMAIL CHACK" disabled="disabled">
						<div class="eheck_font" id="mail_check_input_box_warn"></div>
						</div>
					</div>
					<div class="divForm">
					<div style="width: 500px;">
						<label for="password" class="formLabel" style="margin-right:32px;">비밀번호</label>
						<input type="password" id="password" class="input_form" placeholder="PASSWORD" name="password">
						<div class="eheck_font" id="pw_check"></div>
						</div>
					</div>
					<div class="divForm">
					<div style="width: 500px;">
						<label for="passwordVer" class="formLabel">비밀번호 확인</label>
						<input type="password" id="passwordVer" class="input_form" placeholder="PASSWORD" name="passwordVer">
						<div class="eheck_font" id="pw2_check"></div>
						</div>
					</div>
					<div class="divForm">
					<div style="width: 500px;">
						<label for="nickname" class="formLabel" style="margin-right:47px;">닉네임</label>
						<input type="text" id="nickname" class="input_form" placeholder="NICKNAME" name="nickname">
						
						<div class="eheck_font" id="nick_check"></div>
						</div>
						
					</div>
					<div class="divForm">
					<div style="width: 500px;">
						<label for="name" class="formLabel" style="margin-right:59px;">이름</label>
						<input type="text" id="name" class="input_form" placeholder="NAME" name="name">
						<div class="eheck_font" id="name_check"></div>
						</div>
					</div>
					<div class="divForm">
					
						<label for="year" class="formLabel" style="margin-right:45px;">생년월일</label>
						<input type="text" class="input_form" id="year" placeholder="YEAR" name="birth">
						
						<div class="eheck_font" id="birth_check"></div>
						
					</div>
					<div class="divForm">
					
						<label for="gender" class="formLabel" style="margin-right:75px;">성별</label>
						<div style="dislay:flex;">
						<input type="radio" class="radio" name="gender" value="남자">남자
						<input type="radio" class="radio" name="gender" value="남자">여자
						</div>
						<div class="eheck_font" id="gender_check"></div>
						
					</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    
                    
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
					<div class="divForm"> 
 					<div style="width: 500px;">
						<label for="address" class="formLabel" style="margin-right:59px;">주소</label>
						<input type="text" id="sample6_postcode" class="address1" placeholder="ADDRESS" name="address" >
						<input type="text" id="sample6_address" class="address2" placeholder="ADDRESS" name="address_detail" >
						
						<div class="eheck_font" id="addr_check"></div>
						</div>
						<input type="button" value="주소검색" onclick="sample6_execDaumPostcode()">
					</div>
					<div class="divForm">
					<div style="width: 500px;">
						<label for="addressDetail" class="formLabel" style="margin-right:30px;">상세주소</label>
						<input type="text" id="sample6_detailAddress" class="input_form" placeholder="ADDRESS DETAIL" name="address_detail2">
					</div>
					</div>
					<div class="divForm">
						<input type="submit" class="btn" value="회원가입">
					</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	
	
	<%@ include file="footer.jsp" %>	
</body>
</html>