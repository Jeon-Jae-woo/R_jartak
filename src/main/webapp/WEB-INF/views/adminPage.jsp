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
        
        //신고 상세 팝업창 띄움
    	function reportDetail(){
    		window.open("admin/report", "신고", "width=500px, height=500px");
    	}
    </script>
    <style type="text/css">
    	dd{
    		margin: 0;
		}
		a{
		    text-decoration:none; color:black;
		}
		
		th{
			background: #eee;
		}
		
		th,td{
			border-bottom: 1px solid #ccc;
		    padding: 10px;
		}
		
		
		td{
		    text-align: center;
		}
		
		#Nav{
		    background-color: gray;
		}
		
		/* 페이지 전체 */
		#main {
		    max-width: 0 auto;
		    margin: 0 auto;
		    margin-top: 5%;
		    display: flex;
		   justify-content: space-evenly;
		}
		
		/* 왼쪽 메뉴 */
		#menu {
		    min-height: 1000px; 
		    min-width: 18%;
		    border-right:1px solid;
		}
		
		
		#title{
		    font-size: 25px;
		
		}
		
		/* 왼쪽 nav ul*/
		#Mul{
			margin-top:18%;
		    list-style: none;
		    text-align: center;
		    padding-inline-start: 0px;
		    justify-content: center;
		}
		
		/* 왼쪽 nav li*/
		.Mli{
		    margin-top: 20px;
		    margin-bottom: 20px;
		}
		#search{
			display:flex;
			justify-content: flex-end;
		    width: 100%;
		    height: 30px;   
		    margin:2px;
		}
		
		/*
		#search_mem{
		    height: 23px;
		    background-color: black;
		    color: white;
		}
		*/
		
		#search_sel{
		   
		    margin-right: 5px;
		    height: 25.5px;
		    
		}
		
		#search_box{
		    
		    outline: none;
		 }
		
		 
		
		 #re_table{
		     margin-top: 38px;
		     display:flex;
		     justify-content: center;
		 }
		
		 @media (max-width:600px){
		    #main {
		        display: block;    
		    }
		
		    #main #contents {  
		        margin-bottom: 10px; 
		        margin-right: 0px;
		    }
		    #main #menu {
		        min-height: 0;
		    }
		}
		
		#footer {
		    margin-top: 10px; 
		    
		}
		
		#O {
		    color: blue;
		}
		#X {
		    color: red;
		}
		
		.sub_title{
		    text-align: center;
		}
		
		#complete{
		    color: blue
		}
		
		#com{
		    background-color: red;
		    color: white;
		}
		#acc{
		    background-color: green;
		    color: white;
		}
		
		#with_comT{
		    color: red;
		}
		#with_accT{
		    color: green;
		}
		
		#rep_null{
		    background-color: green;
		    color: white;
		}
		#rep_black{
		    background-color: red;
		    color: white;
		}
		
		/* 중간*/
		#member, #report, #withdraw{
			width:70%;
			
		}
		
		#report_a{
			text-decoration: underline;
			color:navy;
		}
    </style>

</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
    <div id="main">
        
        <div id="menu">
            
            <h2 id="title" style="text-align:center;">관리자 메뉴</h2>
            
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
                	<form action="" method="post">
	                    <select id="search_sel">
	                        <option>이메일</option>
	                        <option>닉네임</option>
	                    </select>
	                    <input type="search" id="search_box">
	                    
	                    <input type="button" value="검색" id="search_mem" >
                    </form>
                </div>

                <div class="table" >
                    <table>
                        <col width="20%">
                        <col width="80px">
                        <col width="150px">
                        <col width="150px">
                        <col width="80px">
                        <col width="180px">
                        <col width="5%">
                        <col width="5%">
	                        <thead>
		                        <tr>
		                            <th>이메일</th>
		                            <th>닉네임</th>
		                            <th>이름</th>
		                            <th>가입날짜</th>
		                            <th>보유금액</th>
		                            <th>거래금액</th>
		                            <th>상태</th>
		                            <th>변경</th>
		                        </tr>
	                        </thead>
                        
	                        <tbody>
		                        <tr>             
		                            <td>jaewoo6836@naver.com</td>
		                            <td>NICKNAME</td>
		                            <td>NAME</td>
		                            <td>2021-10-10</td>
		                            <td>1000000</td>
		                            <td>5000000</td>
		                            <td>
					                    <select id="">
					                        <option>활동</option>
					                        <option>정지</option>
					                        <option>탈퇴</option>
					                    </select>
		                            </td>
		                            <td>
		                            	<input type="button" value="변경"/>
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
                        <table>
                            <col width="50px">
                            <col width="450px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <thead>
	                            <tr>
	                                <th>NO</th>
	                                <th>제목</th>
	                                <th>신고자</th>
	                                <th>신고대상</th>
	                                <th>신고날짜</th>
	                               	<th>처리</th>
	                            </tr>
                            </thead>
                            
                            <tbody>
	                            <tr>
	                                <td>1</td>
	                                <td><a id="report_a" href="javascript:void(0);" onclick="reportDetail();">신고 제목</a></td>
	                                <td>욕먹은사람</td>
	                                <td>욕쟁이</td>
	                                <td>2021.09.24</td>
	                                <td>
	                                    <input type="button" class="rep_button" id="" value="정지">
	                                    <input type="button" class="rep_button" id="" value="탈퇴">
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
                    <col width="300px">
                    <col width="200px">
                    <col width="150px">
                    <col width="200px">
                    
                    <thead>
                    	<tr>
                        	<th>NO</th>
                        	<th>이메일</th>
                        	<th>닉네임</th>
                        	<th>출금액</th>
                        	<th>상태</th>
                        	
                    	</tr>
                    </thead>
                    
                    <tbody>
                    		<tr>	
                        		<td>1</td>
                        		<td>jaewoo6836@naver.com</td>
                        		<td>NICKNAME</td>
                        		<td>50000</td>
                        		<td>
                        			<button onclick="">승인</button>
                        			<button onclick="">거절</button>
                        			<button onclick="">보류</button>
                        		</td>
                        		<!-- 
                        		<td>
                            		<button class="with_button" id="com">반려</button>
                            		<button class="with_button" id="acc">수락</button>
                            		<a class="with_text" id="with_comT"><strong>반려되었습니다.</strong></a>
                            		<a class="with_text" id="with_accT"><strong>수락되었습니다.</strong></a>
                            	</td>
                            	-->
							</tr>
                    </tbody>
                </table>
            </div>
            
		</div>
	</div>
	
	
	<%@ include file="footer.jsp"  %>	
</body>
</html>