<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_emoney_charge.css">
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
                       <h4 style="margin-left: 10px; ">나의 계좌관리</h4>

                       <h5 style="margin-left:30px;margin-bottom: 0px; ">충전</h5>

                       <div class="grade-content" style="margin-left: 20px;">
                           <form action="">

                            <table class="type05">
                                <tr>
                                  <th scope="row">입금방법</th>
                                  <td>
                                      <input type="radio" name="chargeway" value="무통장입금" checked>무통장입금
                                      <input type="radio" name="chargeway" Value="가상계좌">가상계좌
                                      <input type="radio" name="chargeway" value="간편결제">간편결제
                                      <input type="radio" name="chargeway" value="신용카드">신용카드
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">충전금액</th>
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
                                <tr>
                                    <th scope="row">입금예정인</th>
                                    <td><input type="text" id="update_date" name="update_date" value=""></td>
                                  </tr>
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" value="충전신청">
                                    <input type="button" name="" value="취소"  onclick="">
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