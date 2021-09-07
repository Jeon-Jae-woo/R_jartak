<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#alert-success").hide();
	$("#alert-wrong").hide();
	$("input").keyup(function(){
		var pwd1 = $("#pwd1").val();
		var pwd2 = $("#pwd2").val();
		if(pwd1!=""||pwd2!=""){
			if(pwd1==pwd2){
				$("#alert-success").show();
				$("#alert-wrong").hide();
				$("#submit").attr("disabled",false);
			}else{
				$("#alert-success").hide();
				$("#alert-wrong").show();
				$("#submit").attr("disabled",true)
			}
			
		}
	});
	
});
</script>


</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_personal_quit.css">
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
              
            	<a href="mypage.do?email=kh@kh.co.kr">개인정보관리</a>
                <a href="mypage_quit.do" style="background-color: lightseagreen;">회원탈퇴</a>
            </div>    
            <div id="main">
                
                <div id=contents>

                    <div class="content">
                       <h4 style="margin-left: 10px; ">회원탈퇴</h4>
                       <div class="grade-content">
                           <form action="deleteInfo.do?email=${dto.email}">
                                <div>비밀번호 확인 : 
                                	<input type="password" id="pwd1"   placeholder="비밀번호를 입력해 주세요">
                                	<input type="hidden" id="pwd2" value="${dto.password}">
                                	<div class="alert-success" id="alert-success">비밀번호가 일치합니다</div>
                                	<div class="alert-wrong" id="alert-wrong">비밀번호가 일치하지 않습니다.</div>
                                	
                                </div>
                           
                                    <input id="submit" style="width:min-content; margin-left:120px;margin-top: 25px;" type="submit" value="탈퇴" disabled="disabled">

                            </form>
                        </div>

                       
                    </div>
                    
                    
                </div>
                  
                    

         
                  
            </div>    
        </div>
    </section>
</body>
</html>