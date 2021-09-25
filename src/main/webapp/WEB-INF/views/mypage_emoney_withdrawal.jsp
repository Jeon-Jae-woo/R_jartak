<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function withdrawalInfo(){
		var requiredInfo = $("#bank_info option:selected").text();
		if( requiredInfo== "" || requiredInfo==null){
			alert("계좌를 등록해주세요");
			return;
		}
		var withdrawal_amount = $("#withdrawal_amount").val();
		var account_no = $("#bank_info option:selected").val();
		var nickname = $("#nickname").val();
		console.log("withdrawal_amount="+withdrawal_amount+"account_no="+account_no+"nickname="+nickname);
 		location.href="insertWithdrawal?withdrawal_amount="+withdrawal_amount+"&account_no="+account_no+"&nickname="+nickname;
	}
</script>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_emoney_withdrawal.css">

<body>
<%@ include file="header.jsp"  %>
<section>
        <h1 style="margin-left: 5px;">마이페이지</h1>
        
     <div id="navi" >
            <div id="navi_text">
            <a href="mypage_interest.do?pageNum=1" style="font-weight:bold">활동</a>
            <a href="mypage_msg_receive.do" >메시지</a>
            <a href="mypage.do">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                         <a href="mypage_interest.do?pageNum=1">관심상품</a>
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

                            <table class="type05">
                                <tr>
                                  <th scope="row">e머니 잔액</th>
                                  <td>
                                        <span>${dto.amount}원</span>
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">출금액</th>
                                  <td><input type="text" id="withdrawal_amount" name="withdrawal_amount"></td>
                                </tr>
                                
                                <c:choose>
                                    <c:when test="${empty AccountNoList}">
                                 		<tr>
                                 			<td colspan="2">계좌번호가 없습니다. 등록 후 이용해 주세요</td>
                                 		</tr>   				
                                    </c:when>
                                    <c:otherwise>
                                    	
                                    		 <tr>
				                                  <th scope="row">출금계좌</th>
				                                  <td>
				                                  	<input type="hidden" id="nickname" value="${dto.nickname}">
				                                    <select name="bank_info" id="bank_info">
				                                    	<c:forEach items="${AccountNoList}" var="list">
				                                        	<option value="${list.account_no}">은행코드 : ${list.bank_no} 계좌번호: ${list.account_number} </option>
				                                    	</c:forEach>
				                                    </select>
				                                  </td>
			                                </tr>
                                    	
                                    </c:otherwise>
                                    
                                    
                                </c:choose>
                                
                             
                               
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                    <input type="submit" value="출금신청" onclick="withdrawalInfo();">
                                    <input type="button" name="" value="취소"  onclick="location.href='mypage_emoney.do?emoney=main'">
                                </div>

                        </div>

                       
                    </div>
                    
                    
                </div>
                  
                    

         
                  
            </div>    
        </div>
    </section>


</body>
</html>