<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_emoney.css">
<body>
   <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
        <div id="navi" name="navi">
            <div id="navi_text">
          <a href="mypage_interest.do" style="font-weight:bold">활동</a>
            <a href="mypage_msg_receive.do" >메시지</a>
            <a href="mypage.do?email=kh@kh.co.kr">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
               <a href="mypage_interest.do">관심상품</a>
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main" style="background-color: lightseagreen;">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
            </div>    
            <div id="main">
                 
                <div id=contents>
                    <h4>e머니관리</h4>
                    <div class="emoney-contentBox">
                        
                        <div class="subbox" style="width: 50%;">    
                            <div style="padding-left: 10px; padding-top: 10px; ">
                                <div >
                                    		사용 가능 이머니
                                </div>

                                <div style="float: right; margin-top: 20px; margin-right: 20px;">
                                    ${dto.amount}원<button onclick="location.href='mypage_emoney.do?emoney=charge'">충전</a></button>
                                </div>
                            </div>

                        </div>

                        <div class="subbox" style="border-left: 1px solid darkseagreen;"> 
                            <div style="padding-left: 10px; padding-top: 10px; ">
                                <div >
                                   		 출금 가능 이머니
                                </div>

                                <div style="float: right; margin-top: 20px; margin-right: 20px;">
                                    ${dto.amount}원<button onclick="location.href='mypage_emoney.do?emoney=withdrawal'">출금</button>
                                </div>
                            </div>
                        </div>
    
                    
                    </div>

                    <div class="content">
                        <h4>e머니 거래내역</h4>
                            <table class="type11">
                                <thead>
                                <tr>
                                  <th scope="cols">사용종류</th>
                                  <th scope="cols">결재번호</th>
                                  <th scope="cols">금액</th>
                                  <th scope="cols">결제상태</th>
                                  <th scope="cols">등록일</th>
                                  <th scope="cols">완료일</th>
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