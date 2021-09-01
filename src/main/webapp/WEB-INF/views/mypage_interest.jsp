<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_interest.css">


<body>
<header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">구매등급</h1>
        
  <div id="navi" >
            <div id="navi_text">
            <a href="mypage_interest.do" style="font-weight:bold">활동</a>
            <a href="mypage_msg_receive.do" >메시지</a>
            <a href="mypage.do?email=kh@kh.co.kr">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                         <a href="mypage_interest.do" style="background-color: lightseagreen;">관심상품</a>
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
        
        
            </div>    
            <div id="main">
                <h3 style="margin-left:40px;" >관심상품</h3>
                
                <div id=items>

                    <div class="item">
                       <div class="item-Content">
                           <a href="https://www.ebay.com/itm/203563789808">
                               <div class="item-image"><img src="image/img01.png"></div>
                               <div class="item-title"><a href="https://www.ebay.com/itm/203563789808">Men 8.0Us Vans Usa Made In Authentic Pink Vintage</a></div>
                               <div class="item-price"><span>$277.23</span></div>
                            </a>
                       </div>
                    </div>

                    <div class="item">
                        <div class="item-Content">
                            <a href="https://www.ebay.com/itm/203563789808">
                                <div class="item-image"><img src="image/img01.png"></div>
                                <div class="item-title"><a href="https://www.ebay.com/itm/203563789808">Men 8.0Us Vans Usa Made In Authentic Pink Vintage</a></div>
                                <div class="item-price"><span>$277.23</span></div>
                             </a>
                        </div>
                     </div>


                     <div class="item">
                        <div class="item-Content">
                            <a href="https://www.ebay.com/itm/203563789808">
                                <div class="item-image"><img src="image/img01.png"></div>
                                <div class="item-title"><a href="https://www.ebay.com/itm/203563789808">Men 8.0Us Vans Usa Made In Authentic Pink Vintage</a></div>
                                <div class="item-price"><span>$277.23</span></div>
                             </a>
                        </div>
                     </div>                 
                  
            </div>
            </div>    
        </div>
    </section>
</body>
</html>