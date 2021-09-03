<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/addresssapi.js"></script> --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#alert-success").hide();
	$("#alert-wrong").hide();
	$("input").keyup(function(){
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if(pwd1!="" || pwd2!=""){
			if(pwd1==pwd2){
				$("#alert-success").show();
				$("#alert-wrong").hide();
				$("#update").attr("disabled",false)
			}else{
				$("#alert-success").hide();
				$("#alert-wrong").show();
				$("#update").attr("disabled",true)
			}
		}
	});

});



function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

</script>

</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_personal.css">
<body>

   <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
        <div id="navi" name="navi">
            <div id="navi_text">
	            <a href="mypage_interest.do">활동</a>
	            <a href="mypage_msg_receive.do">메시지</a>
	            <a href="mypage.do?email=kh@kh.co.kr" style="font-weight:bold ">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                <a href="mypage.do?email=kh@kh.co.kr" style="background-color: lightseagreen; " >개인정보관리</a>
                <a href="mypage_quit.do">회원탈퇴</a>
             
            </div>    
            <div id="main">
                
                <div id=contents>

                    <div class="content">
                       <h4 style="margin-left: 10px; ">기본정보입력</h4>
                       <div class="grade-content">
                           <form action="update_info.do" method="get">

                            <table class="type05">
                                <tr>
                                    <th>이메일*</th>
                                    <td>
                                        <input type="text" class="email_cont" id="user_email" name="email" value="${dto.email }" disabled>
                                        <input type="hidden" name="email" value="${dto.email }">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>비밀번호*</th>
                                    <td>
<%--                                         <input type="password" id="user_pw" name="user_pw" value="${dto.password }" disabled onchange="pwChk();"> --%>
                                         <input type="password" name="password" id="pwd1" class="form-control" value="${dto.password }" required>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호확인*</th>
                                    <td>
										<div><input type="password"  id="pwd2" class="form-control" value="${dto.password }" required></div>
										 <div class="alert-success" id="alert-success">비밀번호가 일치합니다.</div>
										 <div class="alert-success" id="alert-wrong">비밀번호가 일치하지 않습니다.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름*</th>
                                    <td><input type="text" id="user_name" name="name" value="${dto.name }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>닉네임*</th>
                                    <td><input type="text" id="nick_name" name="nickname" value="${dto.nickname }" >
                                    </td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td>
                                        <input type="text" id="user_birth" name="birth"  class="email_cont" value="${dto.birth }" disabled>
                                    </td>
                                </tr>
                                
                                <tr class="onlyStdt">
                                    <th>주소*</th>
                                    <td>
                                       <div class="form-group">                   
											<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호"  id="addr1" type="text" readonly="readonly" >
											    <button type="button" class="btn btn-default" onclick="execPostCode();" name="" > 우편번호 찾기</button>                               
											</div>
											<div class="form-group">
											    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="address" id="addr2" type="text" value="${dto.address}" readonly="readonly" />
											</div>
											<div class="form-group">
											    <input class="form-control" placeholder="상세주소" name="address_detail" id="addr3" value="${dto.address_detail}" type="text"  />
											</div>

                                    </td>
                                </tr>
                                
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" id="update" value="개인정보수정">
                                    <input type="button" id="" value="취소" onclick="location.href=''">
                                </div>

                            </form>
                        </div>

                       
                    </div>
                    
                    
                </div>
                  
                    
         
                  
            </div>    
        </div>
    </section>

</body>
</html>