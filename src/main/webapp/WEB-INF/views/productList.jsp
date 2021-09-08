<!-- list페이지(제품 전체 리스트 페이지) -->

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
<html lang="en">
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
	
    <title>list</title>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    


</head>
<body>

	<!-- header 추가 -->
	<%@ include file="header.jsp"  %> 

<div class="container">
    <!-- header 영역 -->
<!-- navigation 영역 -->
<!--
  <div class="navigation">
  
    <div class="navi-category">
 
        <ul>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">조회순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">입찰순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">낮은가격순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">높은가격순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">신규경매순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">인기경매순</p></a></li>
            <li class="brand_item"><a href="" class="brand_box">
                <p class="brand_name">전체보기</p></a></li>
             </div>
     	   <form class="searchBox">
     	   <div class="searchUnder">
  	<input type="text" name="search" class="searchText">
  	<input type="submit" value="검색" class="searchBtn">
  	</div>
  </form>     
                
        </ul>
        
       
     	
  </div>
-->

  
  <!-- main (content)영역 -->
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
  </div>
</div>
 				 <div>
				 	<a href="productAddForm.log">경매 등록</a>
				 </div>  
</div>
				
</div>

	<%@ include file="footer.jsp" %>
</body>
	     

</html>

    