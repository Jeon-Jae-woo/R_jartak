<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_peronal_quit.css">
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
                       <h4 style="margin-left: 10px; ">기본정보입력</h4>
                       <div class="grade-content">
                           <form action="">

                            <table class="type05">
                                <tr>
                                    <th>회원구분*</th>
                                    <td>
                                        ${user.member }회원
                                        <input type="hidden" name="member" value="${user.member }">
                                    </td>
                                </tr>
                                <tr>
                                    <th>아이디*</th>
                                    <td>
                                        <input type="text" id="user_id" name="user_id" value="${user_list.user_id }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호*</th>
                                    <td>
                                        <input type="password" id="user_pw" name="user_pw" value="${user_list.user_pw }" disabled onchange="pwChk();">
                                        <input type="hidden" id="pw" name="pw" value="${user_list.user_pw }">
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호확인*</th>
                                    <td>
                                        <input type="password" id="user_pw2" name="user_pw2" disabled onchange="pwUpdate2();">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름*</th>
                                    <td><input type="text" id="user_name" name="user_name" value="${user_list.user_name }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>닉네임*</th>
                                    <td><input type="text" id="nick_name" name="nick_name" value="${user_list.nick_name }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대폰*</th>
                                    <td>
                                        <input type="text" id="user_phone" name="user_phone"  class="email_cont" value="${user_list.user_phone }" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일*</th>
                                    <td>
                                        <input type="text" class="email_cont" id="user_email" name="user_email" value="${user_list.user_email }" disabled>
                                    </td>
                                </tr>
                                <tr class="onlyStdt">
                                    <th>주소*</th>
                                    <td>
                                        <input type="text" id="user_addr" name="user_addr" value="${user_list.user_addr }" disabled>
                                        <button type="button" id="cnum-btn" onclick="findAddr();">주소검색</button><br>
                                        <input type="text" id="user_addr_de" value="${user_list.user_addr_de }" disabled>
                                    </td>
                                </tr>
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" value="개인정보수정">
                                </div>

                            </form>
                        </div>

                       
                    </div>
                    
                    
                <div>
                  
                    

         
                  
            </div>    
        </div>
    </section>

</body>
</html>