<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_grade.css">
<body>
 <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
        <div id="navi">
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
                       <h4>구매등급</h4>
                       <div class="grade-content">
                        
                            <img src="image/general.png">
                            <span>ooo님의 구매등급은 일반입니다.</span>
                            <div style="border-left: black solid 1px; height: 50px; padding-left: 50px;">
                                <div>구매횟수 : 0회</div>
                                <div>구매총액 : 0원</div>
                            </div>
                       </div>
                    </div>

                    <div class="content">
                        <h4>판매등급</h4>
                        <div class="grade-content">
                         
                             <img src="image/vip.png">
                             <span>ooo님의 구매등급은 일반입니다.</span>
                             <div style="border-left: black solid 1px; height: 50px; padding-left: 50px;">
                                 <div>구매횟수 : 0회</div>
                                 <div>구매총액 : 0원</div>
                             </div>
                        </div>
                     </div>

                    <div class="item">
                       
                     </div>

         		</div>
                  
            </div>    
        </div>
    </section>
</body>
</html>