<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_msg.css">
<body>
     <header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
        <div id="navi" >
            <div id="navi_text">
            <a href="mypage_interest.do?pageNum=1">활동</a>
            <a href="mypage_msg_receive.do" style="font-weight:bold">메시지</a>
            <a href="mypage.do">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                <a href="mypage_msg_send.do">보낸 메시지함</a>
                <a href="mypage_msg_receive.do" style="background-color: lightseagreen;">받은 메시지함</a>
            </div>    
            <div id="main">
                 
                <div id=contents>
                  

                    <div class="content">
                        <h4> 받은 메시지함</h4>
                            <table class="type11">
                                <thead>
                                <tr>
                                  <th scope="cols"><input type="checkbox" name="muldel"></th>
                                  <th scope="cols">보낸사람</th>
                                  <th scope="cols">쪽지내용</th>
                                  <th scope="cols">받은시각</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                  <td><input type="checkbox" name="check"></td>
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