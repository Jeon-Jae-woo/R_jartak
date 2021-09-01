<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_emoney_withdrawal.css">

<body>
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
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main" style="background-color: lightseagreen;">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
        
        
            </div>    
            <div id="main">
                
                <div id=contents>

                    <div class="content">
                       <h4 style="margin-left: 10px; ">e머니관리</h4>

                       <h5 style="margin-left:30px; margin-bottom: 0px; ">출금</h5>

                       <div class="grade-content" style="margin-left: 20px;">
                           <form action="">

                            <table class="type05">
                                <tr>
                                  <th scope="row">e머니 잔액</th>
                                  <td>
                                        <span>0원</span>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">출금액</th>
                                  <td><input type="text" id="bank_account" name="banck_account" value=""></td>
                                </tr>
                                <tr>
                                  <th scope="row">은행명</th>
                                  <td>
                                    <select name="banck_name">
                                        <option value="shinhan">신한은행</option>
                                        <option value="kuk">국민은행</option>
                                        <option value="woori">우리은행</option>

                                    </select>
                                  </td>
                                </tr>
                               
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" value="출금신청">
                                    <input type="button" name="" value="취소"  onclick="location.href='mypage_emoney.do?emoney=main'">
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