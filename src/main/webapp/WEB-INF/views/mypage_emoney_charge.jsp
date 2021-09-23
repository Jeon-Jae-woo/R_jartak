<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function iamport(){

    var name = $("input[name='name']").val();
	var email = $("input[name='email']").val();
	var money = $("input[name='charge_amount']").val();
	var address = $("input[name='address']").val();
	var address_detail = $("input[name='address_detail']").val();
	//가맹점 식별코드
	IMP.init('imp70793077');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'E-money' , //결제창에서 보여질 이름
	    amount : money, //실제 결제되는 가격
	    buyer_email : email,
	    buyer_name : name,
	    buyer_tel : '010-1234-5678',
	    buyer_addr : address,
	    buyer_postcode : address_detail
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	
	        $.ajax({
	        	type: "GET",
	        	url : "charge.do", //충전 금액값을 보낼 url 설정
	        	data : {
	        		"amount" : rsp.paid_amount,
	        		"email"  : email
	        	},
	        	success :function(msg){
	        		if(msg>0){
	        			alert("충전완료");
	        		}else{
	        			alert("충전실패");
	        		}
	        	},
	        	error : function(){
	        		alert("통신실패");
	        	}
	        });
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

function account(){
	$("#charge").removeAttr("onclick");
	$("#charge").attr("onclick","bankaccount_deal()");
	$(".bank_").attr("disabled",false);

	
}

function credit(){
	$("#charge").removeAttr("onclick");
	$("#charge").attr("onclick","iamport();");
	$(".bank_").attr("disabled",true);
}

function bankaccount_deal(){
// 	location.href=""
	alert("충전신청 되었습니다.");
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_emoney_charge.css">
<body>
 <header>header</header>
    <nav></nav>
    
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
                       <h4 style="margin-left: 10px; ">나의 계좌관리</h4>

                       <h5 style="margin-left:30px;margin-bottom: 0px; ">충전</h5>

                       <div class="grade-content" style="margin-left: 20px;">
							  
							
                            
                            <table class="type05" id="bank_account">
                                <tr>
                                  <th scope="row">입금방법</th>
                                  <td>
                                       <input type="button" name="bankAcc" value="무통장입금"  onclick="account();" >
                              		   <input type="button" name="creditCard" value="신용카드" onclick="credit();" >
                                  </td>
                                </tr>
                                <tr>
                                  <th scope="row">충전금액</th>
                                  <td><input type="text"  name="charge_amount" value=""></td>
                                </tr>
                                <tr>
                                  <th scope="row">은행명</th>
                                  <td>
                                    <select name="bank_name" class="bank_">
                                        <option value="shinhan">신한은행 110-321-2132131(이신한)</option>
                                        <option value="kuk">국민은행 123133-1231-2312(김국민)</option>
                                        <option value="woori">우리은행 1002-434-324131(김우리)</option>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                    <th scope="row">입금예정인</th>
                                    <td><input type="text" id="update_date" class="bank_" name="update_date"></td>
                                 </tr>
                              </table>
                                <div class="buttons" style="margin-left: 200px;">
                                	
                                    <input type="button" id="charge" onclick="iamport();" value="충전">
                                    <input type="button" name="" value="취소"  onclick="location.href='mypage_emoney.do?emoney=main'">
                                </div>
					
                        </div>

                       
                    </div>
                    
                    
                </div>
                  
                    

         
                  
            </div>    
        </div>
        
   	 <input type="hidden" name="name" value="${dto.name}">
   	 <input type="hidden" name="email" value="${dto.email}">
   	 <input type="hidden" name="address" value="${dto.address}">
   	 <input type="hidden" name="address_detail" value="${dto.address_detail}">
        
        
    </section>
</body>
</html>