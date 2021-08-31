<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_buy_sale.css">
<body>
 <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
 <div id="navi" >
            <div id="navi_text">
            <a href="mypage_interest.do" style="font-weight:bold">활동</a>
            <a href="mypage_msg_receive.do" >메시지</a>
            <a href="mypage.do?email=kh@kh.co.kr">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                         <a href="mypage_interest.do">관심상품</a>
                <a href="mypage_buy.do?money=end"  style="background-color: lightseagreen;">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
        
        
            </div>    
            <div id="main">
                 
                <div id=contents>
                    <h4>구매관리</h4>
                    <div class="emoney-contentBox">
                        
                           <button onclick="location.href='mypage_buy.do?money=ing'">입찰중인 물품</button>
                            <button onclick="location.href='mypage_buy.do?money=end'">경매종료 물품</button>
                            <button onclick="location.href='mypage_buy.do?money=trading'">구매 물품 거래 진행 중</button>
                            <button onclick="location.href='mypage_buy.do?money=failure'">구매거부/반품/미입금</button>
    
                    
                    </div>

                    <div class="content">
                        <h4>구매거부/반품/미입금 목록</h4>
                            <table class="type11">
                                <thead>
                                <tr>
                                  <th scope="cols">물품번호</th>
                                  <th scope="cols">이미지</th>
                                  <th scope="cols">물품명</th>
                                  <th scope="cols">금액정보</th>
                                  <th scope="cols">판매자</th>
                                  <th scope="cols">현재상태</th>
                                  <th scope="cols">처리현황</th>
                                  <th scope="cols">날짜정보</th>
                                  <th scope="cols">관리</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>
                                  <td>내용</td>

                                </tr>
                              
                                </tbody>
                              </table>
                            
                     </div>

                    <div class="item">
                       
                     </div>

         
                  </div>
            </div>    
        </div>
    </section>
</body>
</html>