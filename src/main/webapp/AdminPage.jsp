<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminpage.css"/>
	
	<script type="text/javascript" href="jQuery/jquery-3.6.0.min.js" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#report").css("display","none");
            $("#withdraw").css("display","none");


            $("#M_report").click(function() {
                $("#member").hide();
                $("#report").show();
                $("#withdraw").hide();
            });
            $("#M_withdraw").click(function() {
                $("#member").hide();
                $("#report").hide();
                $("#withdraw").show();
            });
            $("#M_member").click(function(){
                $("#member").show();
                $("#report").hide();
                $("#withdraw").hide();
            });


            $("#X").css("display","none");
            $("#white").css("display","none");

            $("#black").click(function(){
                var con = confirm("블랙리스트에 올리시겠습니까?");
                if(con = true) {
                    alert("블랙리스트 처리되었습니다.");
                    $("#black").hide();
                    $("#white").show();
                    $("#O").hide();
                    $("#X").show();
                }else {
                    alert("취소되었습니다.");
                }
            });
            $("#white").click(function(){
                var con = confirm("다시 화이트리스트로 바꾸시겠습니까?");
                if(con = true) {
                    alert("로그인이 가능한 사용자가 되었습니다.");
                    $("#black").show();
                    $("#white").hide();
                    $("#O").show();
                    $("#X").hide();
                }else{
                    alert("취소되었습니다.");
                }
            });


            $("#complete").css("display","none");
            
            $("#rep_black").click(function(){
                var con = confirm("블랙리스트에 올리시겠습니까?");
                if(con = true) {
                    alert("블랙리스트 처리되었습니다.");
                    $(".rep_button").hide();
                    $("#complete").show();
                }else {
                    alert("취소되었습니다.");
                }
            });
            $("#rep_null").click(function(){
                var con = confirm("무효처리하시겠습니까? \n신고대상자에게 패널티가 적용되지 않습니다.");
                if(con = true) {
                    alert("무효처리 되었습니다.");
                    $(".rep_button").hide();
                    $("#complete").show();
                }else {
                    alert("취소되었습니다.");
                }
            });


            $(".with_text").css("display","none");
            
            $("#com").click(function(){
                $(".with_button").hide();
                $("#with_comT").show();
            });
            $("#acc").click(function(){
                $(".with_button").hide();
                $("#with_accT").show();
            });
            
            
        });
    </script>

</head>
<body>
	<h1 id="Nav">Header</h1>
    
    <div id="main">
        
        <div id="menu">
            
            <h2 id="title">관리자 메뉴</h2>
            
            <ul id="Mul">
                <li class="Mli" id="M_member"><a href="#">회원관리</a></li>
                <li class="Mli" id="M_report"><a href="#">신고관리</a></li>
                <li class="Mli" id="M_withdraw"><a href="#">출금관리</a></li>
            </ul>
        </div>

            <div id="member">
                <h2 class="sub_title">회원관리</h2>
                <hr>
                <div id="search">
                    <input type="button" value="검색" id="search_mem" >
                    <select id="search_sel">
                        <option>전체</option>
                        <option>아이디</option>
                        <option>이름</option>
                        <option>이메일</option>
                        <option>전화번호</option>
                        <option>블랙리스트</option>
                    </select>
                    <input type="search" id="search_box">
                </div>

                <div class="table" >
                    <table border="1">
                        <col width="50px">
                        <col width="300px">
                        <col width="150px">
                        <col width="80px">
                        <col width="150px">
                        <col width="150px">
                        <col width="80px">
                        <col width="180px">
	                        <thead>
		                        <tr>
		                            <th><input type="checkbox"></th>
		                            <th>아이디</th>
		                            <th>비밀번호</th>
		                            <th>이름</th>
		                            <th>이메일</th>
		                            <th>전화번호</th>
		                            <th>점수</th>
		                            <th>로그인 불/가능</th>
		                            <th>블랙/화이트 처리</th>
		                        </tr>
	                        </thead>
                        
	                        <tbody>
		                        <tr>
		                            <td><input type="checkbox"></td>
		                            <td>ID</td>
		                            <td>PW</td>
		                            <td>NAME</td>
		                            <td>Email@email.com</td>
		                            <td>01012345678</td>
		                            <td>0</td>
		                            <td>
		                                <a id="O"><strong>O</strong></a>
		                                <a id="X"><strong>X</strong></a>
		                            </td>
		                            <td>
		                                <input type="button" id="black" value="블랙리스트">
		                                <input type="button" id="white" value="화이트리스트">
		                            </td>
	                        	</tr>
                        	</tbody>
                    	</table>
                	</div>
                </div>
                
                <!-- 신고관리 -->
                <div id="report">
                    
                    <h2 class="sub_title">신고관리</h2>
                    <hr>
                    <div class="table" id="re_table">
                        <table border="1">
                            <col width="50px">
                            <col width="450px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            
                            <thead>
	                            <tr>
	                                <th>NO</th>
	                                <th>신고사유</th>
	                                <th>신고자</th>
	                                <th>신고대상자</th>
	                                <th>신고날짜</th>
	                                <th>처리상태</th>
	                            </tr>
                            </thead>
                            
                            <tbody>
	                            <tr>
	                                <td>1</td>
	                                <td>욕설 / 부적절한 단어 사용</td>
	                                <td>욕먹은사람</td>
	                                <td>욕쟁이</td>
	                                <td>2021.09.24</td>
	                                <td>
	                                    <input type="button" class="rep_button" id="rep_null" value="무효">
	                                    <input type="button" class="rep_button" id="rep_black" value="블랙">
	                                    <a id="complete"><strong>처리완료</strong></a>
	                                </td>
	                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
            <!-- 출금관리 -->
            <div id="withdraw">
            <h2 class="sub_title">출금관리</h2>
            <hr>
            
            <div class="table" id="re_table">
                <table>
                    <col width="50px">
                    <col width="350px">
                    <col width="100px">
                    <col width="100px">
                    <col width="200px">
                    <col width="300px">
                    
                    <thead>
                    	<tr>
                        	<th>NO</th>
                        	<th>상품</th>
                        	<th>판매자</th>
                        	<th>구매자</th>
                        	<th>출금 금액</th>
                        	<th>허가여부</th>
                    	</tr>
                    </thead>
                    
                    <tbody>
                    	<form>
                    		<tr>
                        		<td>1</td>
                        		<td>상품이름</td>
                        		<td>김판매</td>
                        		<td>이구매</td>
                        		<td>1,000,000</td>
                        		<td>
                            		<button class="with_button" id="com">반려</button>
                            		<button class="with_button" id="acc">수락</button>
                            		<a class="with_text" id="with_comT"><strong>반려되었습니다.</strong></a>
                            		<a class="with_text" id="with_accT"><strong>수락되었습니다.</strong></a>
                        		</td>
							</tr>
                		</form>
                    </tbody>
                </table>
            </div>
            
		</div>
	</div>
</body>
</html>