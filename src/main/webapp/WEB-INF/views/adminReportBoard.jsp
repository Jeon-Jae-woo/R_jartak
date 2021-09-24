<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#complete").css("display","none");
	   	$(".reportA").click(function(){
	    	var reportBtn = $(this);
	    	var td = reportBtn.parent().children();
	    	var inputVal = td.eq(1).val();
	    	
	    	console.log(inputVal);
	    	
	    	window.open("adminReportDetail?report_no="+inputVal, "신고내용", "width=500px, height=500px");
		    	
		   });
	   	   
   	   $(".stopStatus").click(function(){
   		   var statusBtn = $(this);
   		   var td = statusBtn.parent().parent().children().eq(0).children();
   		   var report_no = td.eq(1).val();
   		   
   		   var target_nickname = statusBtn.parent().parent().children().eq(2).text();

   		   ChangeStatus(2,report_no,target_nickname);
   	   });
	   	   
   	   $(".outStatus").click(function(){
   		   var statusBtn = $(this);
   		   var td = statusBtn.parent().parent().children().eq(0).children();
   		   var report_no = td.eq(1).val();
   		   
   		   var target_nickname = statusBtn.parent().parent().children().eq(2).text();

   		   ChangeStatus(3,report_no,target_nickname);
   	   });

	});
	
	function ChangeStatus(status, report_no, target_nickname){
		var reportMemberStatus = {
				"status_no":status,
				"report_no":report_no,
				"target_nickname":target_nickname
		};
		
		$.ajax({
			type:"POST",
			url:"adminReportProcessing",
			data:JSON.stringify(reportMemberStatus),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log(data.status);
				if(data.status=='OK'){
					alert("변경 완료");
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
	
	//window.setTimeout('window.location.reload()', 5000);    
	    
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

                <!-- 신고관리 -->
                <div id="report">
                    
                    <h2 class="sub_title">신고관리</h2>
                    <hr>
                    <div class="table" id="re_table">
                        <table>
                            <col width="300px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <thead>
	                            <tr>
	                                <th>제목</th>
	                                <th>신고자</th>
	                                <th>신고대상</th>
	                                <th>신고날짜</th>
	                               	<th>처리</th>
	                            </tr>
                            </thead>
                            
                            <tbody>
	            <c:choose>
				<c:when test="${empty reportList }">
						<tr>
							<td colspan="5">신고 내역이 없습니다</td>
						</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="list" items="${reportList}">
					<tr>
						<td>
							<a id="report_a" href="javascript:void(0)" class="reportA">${list.report_title}</a>
							<input type="hidden" value="${list.report_no}">
						</td>
						<td>${list.nickname }</td>
						<td>${list.target_nickname }</td>
						<td>${list.createdLocalDate }</td>
						<td>
	                        <input type="button" class="stopStatus" id="" value="정지">
	                        <input type="button" class="outStatus" id="" value="탈퇴">
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
			      		<a href="adminReportList?pageNum=1" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="adminReportList?pageNum=1">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="adminReportList?pageNum=${ item }">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="adminReportList?pageNum=${totalPage }" aria-label="Next">
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