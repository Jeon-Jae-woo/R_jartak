<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <col width="18%">
                    <col width="120px">
                    <col width="120px">
                    <col width="150px">
                    <col width="100px">
                    <col width="120px">
                    <col width="8%">
                    <col width="15%">
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
              	<c:choose>
					<c:when test="${empty memberlist }">
						<tr>
							<td colspan="8">가입한 회원이 존재하지 않습니다</td>
						</tr>
					</c:when>
				<c:otherwise>
				<c:forEach var="list" items="${memberlist}">
					<tr>
						<td>${list.email }</td>
						<td>${list.nickname }</td>
						<td>${list.name }</td>
						<td>${list.created_at }</td>
						<td>${list.amount }</td>
						<td>${list.tx_amount }</td>
						<td id="status_td">
		                    ${list.memberStatus.status_name }	                    
		                <script>
	                    </script>
                        </td>
                        <td>
                        	<form id="memberStatusForm" action="adminChangeStatus" method="POST">
                           		<input type="hidden" value="${list.email}" name="email" id="email"/>
                           		<input type="hidden" value="${paging.pageNum}" name="pageNum" id="pageNum"/>
                        		<select name="status" id="status">
                        			<option value="0">상태</option>
                        			<option value="1">활동</option>
                        			<option value="2">정지</option>
                        			<option value="3">탈퇴</option>
                        		</select>
                        	<input type="submit" value="변경"/>
                        	</form>
                        </td>
					</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
                    	</tbody>
                	</table>
            	</div>
              	
              	<!-- 회원 목록 페이징 처리 -->
	            <nav class="pull-bottom">
				<c:set var="pageNum" value="${paging.pageNum }"/>
				<c:set var="startPage" value="${paging.startPage}"/>
				<c:set var="endPage" value="${paging.endPage}"/>
				<c:set var="totalPage" value="${paging.totalPage}"/>
				<c:set var="itemCount" value="${paging.itemCount}"/>
					<ul class="pagination">
						<li>
				      		<a href="adminMemberList?pageNum=1" aria-label="Previous">
				        	<span aria-hidden="true">&laquo;</span>
				      		</a>
				    	</li>
						<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
	                		<c:if test="${ pageNum == item }">
	                    		<li><a href="adminMemberList?pageNum=1">${ item }</a></li>
	                		</c:if>
	                		<c:if test="${ pageNum != item }">
			 					<li><a href="adminMemberList?pageNum=${ item }">${ item }</a></li>
	                		</c:if>
	            		</c:forEach>
	            		<li>
				      		<a href="adminMemberList?pageNum=${totalPage }" aria-label="Next">
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