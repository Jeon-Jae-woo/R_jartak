<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage.css">

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
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main">e머니관리</a>
                <a href="mypage_bankAcc.do" style="background-color: lightseagreen;">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
            </div>    
            <div id="main">
                
                <div id=contents>

                    <div class="content">
                       <h4 style="margin-left: 10px; ">나의 계좌관리</h4>
                       <div class="grade-content">
                           <form action="insertBankAcc.do" method="post">

                            <table class="type05">
                                <tr>
                                  <th scope="row">은행명</th>
                                  <td>
                                  	<select name='used_bankname' class='used_bankname'>
					                        <option value=''>선택하세요</option>
					                         <option value='KB국민'>국민은행</option>
					                         <option value='기업'>기업은행</option>
					                         <option value='NH농협'>NH농협은행</option>
					                         <option value='산업'>산업은행</option>
					                         <option value='신한'>신한은행</option>
					                         <option value='한국'>한국은행</option>
					                         <option value='우리'>우리은행</option>
					                         <option value='우체국'>우체국</option>
					                         <option value='카카오뱅크'>카카오뱅크</option>
					                         <option value='수협'>수협은행</option>
					                         <option value='하나'>하나은행</option>
					                         <option value='한국씨티'>한국씨티은행</option>
                        			</select>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">계좌번호</th>
                                  <td><input type="text" id="bank_account" name="bank_account" placeholder="-없이 입력하세요"></td>
                                </tr>
                                <tr>
                                  <th scope="row">예금주</th>
                                  <td><input type="text" id="user_name" name="user_name" value=""></td>
                                </tr>
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" value="은행정보등록">
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