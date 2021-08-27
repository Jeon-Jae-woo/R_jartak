<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/product.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>상품</title>
</head>
<body>
<!-- header 추가 -->
	
	
	<!-- 정보 -->
    <div class="container">
        <!-- header 영역 -->

            <!-- title 영역 -->
           

            <!-- image 영역 -->
            <div class="image">
                <div class="img-div">
                    <img src="#" alt="" id="imgPreview">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">
                <div class="row">
                    
                    <div class="col">
                        
                        <hr>
                        <h3>경매제품 제목영역</h3>
                        <h3>현재 가격 :  000000원</h3>
                        <p id="ss">남은시간 00일00시00분00초</p>
                        <hr>
                        <div class="userinfo">
                            <p><b>판매자ID</b> : </p>
                            <p> silver<b>등급</b> </p>
                            
                        </div>
                        <hr>
                        <p><b>물품번호</b> : 0000000 <input type="button" value="신고"> </p>
                        <p><b>경매기간</b> : 2021/08/10 22:35:22 ~ 2021/08/25 20:03:22 </p>
                        <p><b>시작가</b> : 000000원</p>
                        <p><b>입찰단위</b> : 2000원</p>
                        <p><b>즉시구매</b> : 즉시구매 불가능</p>
                        <p><b>최고입찰자</b> : just3377</p>
                        <p><b>입찰방식</b> : 블라인드 입찰</p>
                        <p><b>입찰 수</b> : 0건 <input type="button" value="경매기록보고 > "></p>
                        <hr>
                       	<p><b>배송방법</b> : 착불[구매자]</p>
                        
                    </div>
                </div>
            	<div class="state">
            	
            			<div class="btns">
                        
                        
                    	<button type="button" class="btn btn-primary btn-lg" onclick="location.href=''" >입찰하기</button>
                    	<button type="button" class="btn btn-secondary btn-lg" onclick="location.href=''">방송보기</button>
                    	
                    	</div>
            		
                </div>
        </div>

        
        <!-- web_edotor -->
        <div class="web_editor">
            <p>제품 상세 정보</p>
            <div class="product_detail_info" style="text-align:center">
               
                
            </div>
            <div class="check_img">
                <img src="img/product/check.png" alt="">
            </div>
            
        </div>

        
    </div>



        <div class="footer">footer</div>

</body>
</html>