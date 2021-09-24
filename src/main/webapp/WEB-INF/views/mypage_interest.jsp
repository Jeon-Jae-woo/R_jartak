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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/list.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/bffb243368.js" crossorigin="anonymous"></script>
	
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/mypage/mypage_interest.css">
<body>
<header>header</header>
    <nav></nav>
    
    <section>
        <h1 style="margin-left: 5px;">구매등급</h1>
        
  <div id="navi" >
            <div id="navi_text">
            <a href="mypage_interest.do?pageNum=1" style="font-weight:bold">활동</a>
            <a href="mypage_msg_receive.do" >메시지</a>
            <a href="mypage.do">계정</a>
             </div>
        </div>
        
        <div id="grid">
            <div id="left-grid">
                         <a href="mypage_interest.do?pageNum=1" style="background-color: lightseagreen;">관심상품</a>
                <a href="mypage_buy.do?money=end">구매관리</a>
                <a href="mypage_sale.do?sale=end">판매관리</a>
                <a href="mypage_emoney.do?emoney=main">e머니관리</a>
                <a href="mypage_bankAcc.do">계좌관리</a>
                <a href="mypage_grade.do">등급관리</a>
        
        
            </div>    
            <<!-- main (content)영역 -->
  <div class="main">

    <div class="content-product">
        <!-- 첫번째 줄 제품 -->
        <div class="product_list">

						<!-- 여기부터 쭉 반복문 코딩 -->		         
				    <c:choose>
						<c:when test="${empty productList }">
							<div>등록된 게시글이 없습니다</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="list" items="${productList}">
							<div>
							</div>
								<div class="product_item">
				                <a href="productDetail?auction_no=${list.auction_no}" class="item_inner">
				                    <div class="product">
				                        <img class="product_img" src="resources/product/${list.product_img}">
				                    </div>
				                    <div class="title">
				                        <div class="브랜드">
				                            <p>${list.auction_title }</p>
				                        </div>
				                        <div class="productId">${list.nickname}</div>
				                    </div>
				                    <div class="price">
				                        <div class="amount">
				                            <b class="num">${list.product_price }</b>
				                        <span class="won"><b>원</b></span>
				                        </div>
				                        <div class="time">남은 시간: ${list.remainingTime }</div>
				                    </div>
				                </a>
				              
				            	</div>
							</c:forEach>
				</c:otherwise>
				</c:choose>
				
			<nav class="pull-bottom">
			<c:set var="pageNum" value="${paging.pageNum }"/>
			<c:set var="startPage" value="${paging.startPage}"/>
			<c:set var="endPage" value="${paging.endPage}"/>
			<c:set var="totalPage" value="${paging.totalPage}"/>
			<c:set var="itemCount" value="${paging.itemCount}"/>
				<ul class="pagination">
					<li>
			      		<a href="productlist?pageNum=1&type=${auctionType}" aria-label="Previous">
			        	<span aria-hidden="true">&laquo;</span>
			      		</a>
			    	</li>
					<c:forEach var="item" varStatus="status" begin="${ startPage }" end="${ endPage }" step="1">
                		<c:if test="${ pageNum == item }">
                    		<li><a href="productlist?pageNum=1&type=${auctionType }">${ item }</a></li>
                		</c:if>
                		<c:if test="${ pageNum != item }">
		 					<li><a href="productlist?pageNum=${ item }&type=${auctionType}">${ item }</a></li>
                		</c:if>
            		</c:forEach>
            		<li>
			      		<a href="productlist?pageNum=${totalPage }&type=${auctionType}" aria-label="Next">
			        	<span aria-hidden="true">&raquo;</span>
			      		</a>
			    	</li>
				</ul>
			</nav>         
  </div>
</div>
 				 
</div>
        </div>
    </section>
</body>
</html>