<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                           <form action="">
                                <div>비밀번호 확인 : <input type="text" value="" placeholder="비밀번호를 입력해 주세요"></div>
                           
                                    <input style="width:min-content; margin-left:120px;margin-top: 25px;" type="submit" value="탈퇴">

                            </form>
                        </div>

                       
                    </div>
                    
                    
                </div>
                  
                    

         
                  
            </div>    
        </div>
    </section>
</body>
</html>