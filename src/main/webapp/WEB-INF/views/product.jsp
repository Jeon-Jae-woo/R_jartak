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

<script type="text/javascript">
	$(function(){
		var time = '${productDetail.remainingSeconds}';
		var auction_no = '${productDetail.auction_no}';
		var product_status = '${productDetail.auction_status_no}';
		
		
		var day = "";
		var hour = "";
		var minute = "";
		var sec = "";
		
		var current_price = '${productDetail.current_price}'
		document.getElementById("productPrice").innerHTML = "현재 가격 : " +current_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		var startPrice = '${productDetail.product_price}';
		document.getElementById("startPrice").innerHTML = "<b>시작가</b> : " + startPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		var biddingUnit = '${productDetail.bidding_unit}';
		document.getElementById("startPrice").innerHTML = "<b>입찰 단위</b> : " + biddingUnit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		
		if(product_status==1){
			var x = setInterval(function(){
				day = parseInt(time/(60*60*24));
				hour = parseInt((time - day * 60 * 60 * 24) / (60 * 60));
				minute = parseInt((time - day * 60 * 60 * 24 - hour * 3600) / 60);
				sec = time % 60;
				document.getElementById("auctionTime").innerHTML = day + "일 " + hour + "시간 " + minute + "분 " + sec + "초";
				time--;
				
				if(day==0){
					if(hour==0){
						if(minute==0){
							document.getElementById("auctionTime").innerHTML = sec + "초";	
						}else{
							document.getElementById("auctionTime").innerHTML = minute + "분 " + sec + "초";
						}
					}else{
						document.getElementById("auctionTime").innerHTML = hour + "시간 " + minute + "분 " + sec + "초";	
					}
					
				}else{
					document.getElementById("auctionTime").innerHTML = day + "일 " + hour + "시간 " + minute + "분 " + sec + "초";
				}
				
				if(time<0){
					clearInterval(x);
					document.getElementById("auctionTime").innerHTML = "경매 종료";
					TimeOut(auction_no);
				}
				
			}, 1000);	
		}else{
			document.getElementById("auctionTime").innerHTML = "경매 종료";
		}
	});
	
	function TimeOut(auction_no){
		var auctionData = {
				"auction_no":auction_no,
		};
		console.log(auction_no);
		
		$.ajax({
			type:"POST",
			url:"timeOut",
			data:JSON.stringify(auctionData),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				if(data.status=='OK'){
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
	
	//입찰 처리
	function bids(){
		//경매 번호, 현재 가격, 입찰 단위
		var auction_no = '${productDetail.auction_no }';
		var current_price = parseInt('${productDetail.current_price}');
		var biddingUnit = parseInt('${productDetail.bidding_unit}');
		
		//입찰 금액
		var bid_price = parseInt(document.getElementById("bidPrice").value);
		
		//입찰 금액보다 낮은 금액인 경우 처리하지 않음
		if((current_price+biddingUnit) > bid_price){
			alert("입찰가능 금액보다 적은 금액을 입력하셨습니다");
			return;
		}
		//입찰 단위 체크
		var temp = current_price - bid_price;
		if(temp%biddingUnit != 0){
			alert("입찰단위 금액에 맞지 않습니다");
			return;
		}
		
		var bidsData = {
				"auction_no":auction_no,
				"current_price":current_price,
				"bid_price":bid_price
		};
		
		var bidParsing = bid_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		if(confirm(bidParsing + " 금액에 입찰 하시겠습니까?") == true){
			$.ajax({
				type:"POST",
				url:"bid",
				data:JSON.stringify(bidsData),
				contentType:"application/json",
				dataType:"json",
				success:function(data){
					if(data.status == 'UNAUTHORIZED'){
						alert("로그인 후 이용해주세요");
						document.location.href = "loginForm";
					}else{
						alert(data.message);
						window.location.reload();
					}
				},
				error:function(){
					alert("서버 에러");
				}
			});
		}else{
			return false;
		}
		
	
		
	}
	
	function report(){
		//세션 및 디테일 페이지에서 유저 아이디를 얻어오고 넘겨줘야 함, controller로 처리되도록 수정 필요
		var nickname = ' ${productDetail.nickname }';
		window.open("reportForm.log?targetNickname="+nickname, "신고", "width=500px, height=500px");
	}

</script>
    <title>상품</title>
</head>
<body>
<!-- header 추가 -->
	<%@ include file="header.jsp" %>
	
	<!-- 정보 -->
    <div class="container">
        <!-- header 영역 -->

            <!-- title 영역 -->
           

            <!-- image 영역 -->
            <div class="image">
                <div class="img-div">
                    <img src="resources/product/${productDetail.product_img}" alt="" id="imgPreview">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">
                <div class="row">
                    
                    <div class="col">
                        
                        <hr>
                        <h3>${productDetail.auction_title }</h3>
                        <h3 id="productPrice"></h3>
                        <p id="auctionTime">  </p>
                        <hr>
                        <div class="userinfo">
                            <p><b>판매자ID</b> : ${productDetail.nickname } </p>
                            <p> ${rank.rank_name} <b>등급</b> </p>
                            
                        </div>
                        <hr>
                        <p><b>물품번호</b> : ${productDetail.auction_no } <input type="button" value="신고" onclick="report();"> </p>
                        <p><b>경매기간</b> : ${productDetail.createDateStr } ~ ${productDetail.endDateStr } </p>
                        <p id="startPrice"></p>
                        <p id="biddingUnit"></p>
                        <p><b>즉시구매</b> : ?</p>
                        <p><b>최고입찰자</b> : ${productDetail.high_bidder }</p>
                        <p><b>입찰방식</b> : ${productDetail.auctionType.auction_type_name } 경매</p>
                        <p><b>입찰 수</b> : ? <input type="button" value="경매기록보고 > "></p>
                        <hr>
                       	<p><b>배송방법</b> : ?</p>
                        <p><b>입찰 :  </b><input id="bidPrice" type="number" placeholder="입찰 금액을 적어주세요"/> 원</p>
                    </div>
                </div>
            	<div class="state">
            	
            			<div class="btns">
                        

                    	<button type="button" class="btn btn-primary btn-lg" onclick="location.href='interested?auction_no=${productDetail.auction_no}&sell_nickname=${productDetail.nickname}'" >관심물품</button>
                    	<button type="button" class="btn btn-primary btn-lg" onclick="bids();" >입찰하기</button>
                    	<button type="button" class="btn btn-secondary btn-lg" onclick="location.href=''">방송보기</button>
                    	
                    	</div>
            		
                </div>
        </div>

        
        <!-- web_edotor -->
        <div class="web_editor">
            <p>제품 상세 정보</p>
            <div class="product_detail_info" style="text-align:center">
               ${productDetail.auction_content }
                
            </div>
            <div class="check_img">
                <img src="" alt="">
            </div>
            
        </div>

        
    </div>

       <%@ include file="footer.jsp" %>

</body>
</html>