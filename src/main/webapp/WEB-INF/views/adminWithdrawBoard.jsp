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
        
        $(".approval").click(function(){
        	var statusBtn = $(this);
        	//승인은 아직 미구현
        	var with_no = statusBtn.parent().children().eq(0).val();
        	var status = '승인';
        	
        	WithdrawalStatus(with_no, status);
        });
        
        $(".refusal").click(function(){
        	var statusBtn = $(this);
        	//PK값 가져옴
        	var with_no = statusBtn.parent().children().eq(0).val();
        	var status = '거절';
        	
        	WithdrawalStatus(with_no, status);
 		});
        $(".pending").click(function(){
        	var statusBtn = $(this);
        	//PK값 가져옴
        	var with_no = statusBtn.parent().children().eq(0).val();
        	var status = '보류';
        	
        	WithdrawalStatus(with_no, status);
 		});
        
    }); 
    
    function WithdrawalStatus(with_no, status){
    	var withInfo = {
    			"with_no":with_no,
    			"status":status
    	}
		$.ajax({
			type:"POST",
			url:"adminWithdrawPC",
			data:JSON.stringify(withInfo),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log(data.status);
				if(data.status=='OK'){
					alert(status+" 되었습니다");
					window.location.reload();
				}else if(data.status='BAD_REQUEST'){
					alert("변경 실패");
				}
			},
			error:function(){
				alert("서버 에러");
			}
		});
    	
    	
    }
    
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
                <li class="Mli" id="M_withdraw"><a href="adminWithdrawList?pageNum=1">출금관리</a></li>
            </ul>
        </div>

            <!-- 출금관리 -->
            <div id="withdraw">
            <h2 class="sub_title">출금관리</h2>
            <hr>
            
            <div class="table" id="re_table">
                <table>
                    <col width="250px">
                    <col width="250px">
                    <col width="200px">
                    <col width="200px">          
                    <thead>
                    	<tr>	
                        	<th>닉네임</th>
                        	<th>출금액</th>
                        	<th>신청날짜</th>
                        	<th>상태</th>
                    	</tr>
                    </thead>
                    
                    <tbody>			
				<c:choose>
				<c:when test="${empty withList }">
						<tr>
							<td colspan="4">출금 신청 내역이 없습니다</td>
						</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="list" items="${withList}">
					<tr>
						<td>${list.nickname }</td>
						<td>${list.amount }</td>
						<td>${list.created_at }</td>
						<td>
							<input type="hidden" value="${list.withdrawal_no}">
							<input type="hidden" value="${list.nickname}">
	                        <input type="button" class="approval" id="" value="승인">
	                        <input type="button" class="refusal" id="" value="거절">
	                        
	                        <!--<a id="complete"><strong>처리완료</strong></a>-->
	                     </td> 
					</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
                    </tbody>
                </table>
            </div>
            <nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="adminWithdrawList?pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="adminWithdrawList?pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="adminWithdrawList?pageNum=${ item }">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="adminWithdrawList?pageNum=${totalPage }" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			</nav>
		</div>
	</div>
	
	
	<%@ include file="footer.jsp"  %>	
</body>
</html>