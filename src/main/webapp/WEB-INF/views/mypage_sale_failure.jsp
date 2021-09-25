<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_buy_sale.css">
<body>
  <%@ include file="header.jsp"  %>
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
                          <a href="mypage_interest.do">관심상품</a>
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end" style="background-color: lightseagreen;">판매관리</a>
                <a href="mypage_emoney.do?emoney=main">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
        
        
            </div>    
            <div id="main">
                 
                <div id=contents>
                    <h4>구매관리</h4>
                    <div class="emoney-contentBox">
                        
              <button onclick="location.href='mypage_sale.do?sale=ing'">진행중인 물품</button>
                            <button onclick="location.href='mypage_sale.do?sale=end'">판매종료 물품</button>
                            <button onclick="location.href='mypage_sale.do?sale=trading'">판매물품 거래 진행 중</button>
                            <button onclick="location.href='mypage_sale.do?sale=failure'">구매거부/반품/미입금</button>
                

    
                    
                    </div>

                    <div class="content">
                        <h4>구매거부/반품/미입금 목록</h4>
                            <c:choose>
	                    	<c:when test="${empty productlist }">
	                    		<table class="type11">
	                    			<tr>
	                    				<td>입찰내역이 없습니다.</td>
	                    			</tr>
	                    		</table>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="list" items="${productlist }" varStatus="status">
                            <table class="type11">
                                <thead>
                                <tr>
                                  <th scope="cols">물품번호</th>
                                  <th scope="cols">이미지</th>
                                  <th scope="cols">물품명</th>
                                  <th scope="cols">금액정보</th>
                                  <th scope="cols">마감일</th>
                                  <th scope="cols">구매자</th>
                                  <th scope="cols">상태</th>
								 
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                  <td><a href="productDetail?auction_no=${list.auction_no}">${list.auction_no }</a></td>
                                  <td><img src="resources/product/${list.product_img}"></td>                                  
                                  <td>${list.auction_title}</td>
                                  <td>${list.current_price}</td>
                                  <td>${list.endDateStr}</td>
                                  <td>${tradeList[status.index].bidder_nickname}</td>
                                  	<c:choose>
                                  		<c:when test=" ${tradeList[status.index].trade_status_no eq 2}">
		                                  	<td>보류</td>
		                                  </c:when>
		                                  <c:otherwise>
		                                  	<td>종료</td>
		                                  </c:otherwise>
                                  	</c:choose>
                                  
                                </tr>
                              
                                </tbody>
                              </table>
                             </c:forEach>
                            </c:otherwise>
                           </c:choose>

                            
                     </div>

                    <div class="item">
                       
                     </div>

         
                 </div>
            </div>    
        </div>
    </section>
</body>
</html>