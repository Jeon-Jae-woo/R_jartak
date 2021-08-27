<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_peronal.css">
<body>
   <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
        <div id="navi" name="navi">
            <div id="navi_text">
            <a href="#">활동</a>
            <a href="#">메시지</a>
            <a href="#">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                <a href="#">관심상품</a>
                <a href="#">구매관리</a>
                <a href="#">판매관리</a>
                <a href="#">e머니관리</a>
                <a href="#">계좌관리</a>
                <a href="#">등급관리</a>
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
                    
                    
                <div>
                  
                    

         
                  
            </div>    
        </div>
    </section>
</body>
</html>