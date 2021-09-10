<!-- 제품 등록 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 인코딩 처리 -->    
<%
    	request.setCharacterEncoding("UTF-8");
    %>    
<%
    	response.setContentType("text/html; charset=UTF-8");
    %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./img/product/assets/2222.ico" />
    <link href="resources/css/productAdd.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">  
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.full.min.js"></script>
    <script language="javascript" src="resources/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/productAdd.js" defer></script>
    
    <title>경매등록</title>
	
	


</head>
<body>
	<!-- header 추가 -->
	<%@ include file="header.jsp" %>
	
	<!-- 로그인 유무 확인 -->
	
	<!-- 정보 -->
    <form action="productAdd.log" method="post" enctype="multipart/form-data" id="check">
    <input type="hidden" name="id" value="${id }">
    <div class="container">

            <!-- title 영역 -->
            <div class="title">
                <p class="add_title">경매 등록</p>
            </div>

            <!-- form tag 시작 -->


            <!-- image 영역 -->
            <div class="image">
                <div class="img-div">
                    <img src="" alt="" id="imgPreview">
                </div>
                <div class="file-div ">
                    <input class="form-control" type="file" name="uploadImg" id="imageupload" onchange="getImage(this.value);">
                </div>
            </div>
            
            <!-- content 영역 -->
            <div class="content">

            <div class="content_title">
               제목입력:
                <br>
                <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" id="pdt_name">
            </div>
            <div class="content_title">
               가격입력:
                <br>
                <input type="text" class="form-control" name="productPrice" placeholder="시작가격을 입력하세요" id="pdt_name">
            </div>
            <div class="content_title">
               입찰단위:
                <br>
                <input type="text" class="form-control" name="biddingUnit" placeholder="입찰단위을 입력하세요" id="pdt_name">         
            </div>
            <div class="content_title">
            <div class="content_title">
               상품이름:
                <br>
                <input type="text" class="form-control" name="productName" placeholder="상품이름을 입력하세요" id="pdt_name">         
            </div>
            <div class="content_title">
               경매 종료 시간:
                <br>
                <input type="date" class="form-control" name="endDate"  id="pdt_name"> 
                <input type="time" class="form-control" name="endTime"  id="pdt_name">           
            </div>
            <hr>

            <div class="content_info">
                
                <div>
                    <!--<label for="" class="form-label">즉시구매</label>
                    <select name="purchase" id="purchase" class="form-select">
                        <option value=""  selected>선택하세요</option>
                        <option value="yes">즉시구매"가능"</option>
                        <option value="no">즉시구매"불가능"</option>
                        
                    </select>
                    -->
                    <label for="" class="form-label">입찰방식</label>
                    <select name="auctionType" id="bidding" class="form-select">
                        <option value="" selected>선택하세요</option>
                        <option value="1">일반경매</option>
                        <option value="2">블라인드경매</option>
                       <!-- 
                    </select>
                    <label for="" class="form-label">배송방법</label>
                    <select class="form-select" name="shipping" id="shipping">
                        <option value="" selected>배송선택</option>
                        <option value="INTEL">착불[구매자]</option>
                        <option value="INTEL">착불[판매자]</option>
                        <option value="AMD">후불[구매자]</option>
                        
                        
                    </select>
                    -->
                </div>
                
            </div>

            <hr>
            
                <div class="btns">
                    <button class="btn btn-secondary btn-lg">취소</button>
                    <input type="submit" class="btn btn-primary btn-lg" value="등록" onclick="return check();">
                </div>
            </div>
        </div>

        <!-- web_edotor -->
        <div class="web_editor">
            <div class="product_detail_info">
                <p>제품 상세 정보</p>
                
            </div>
            <!--업로드 api-->
           <input  type="hidden"  role="uploadcare-uploader"  data-public-key="229de5c2ba401264f679"  name="my_file_input" />
            
            <textarea id="ckeditor" class="ckeditor" name="content" ></textarea>
            <script type="text/javascript">
                
                CKEDITOR.replace( 'ckeditor' ,
                                {height: 700});
                UPLOADCARE_PUBLIC_KEY = 'b0d4d56a64e1f511c63f';
                
            </script>
            
        </div>



    </form>
   
</body>

	     <!-- footer 추가 -->
	
</html>