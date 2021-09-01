<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function() {

        $("#complete").css("display","none");  
        $(".with_text").css("display","none");
    }); 
</script>
<link href="resources/css/adminpage.css" rel="stylesheet"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>
	<jsp:include page="header.jsp"/>
	
    <div id="main">
        
        <div id="menu">
            
            <h2 id="title" style="text-align:center;">관리자 메뉴</h2>
            
            <ul id="Mul">
                <li class="Mli" id="M_member"><a href="adminMemberList?pageNum=1">회원관리</a></li>
                <li class="Mli" id="M_report"><a href="adminReportList?pageNum=1">신고관리</a></li>
                <li class="Mli" id="M_withdraw"><a href="adminWithdrawList">출금관리</a></li>
            </ul>
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
							</tr>
                    </tbody>
                </table>
            </div>
            
		</div>
	</div>
	
	
	<%@ include file="footer.jsp"  %>	
</body>
</html>