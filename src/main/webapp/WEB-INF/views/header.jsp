<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	
	/* 맨 위 nav */
	.header_wrap1 nav{
		display:flex;
		border-bottom : 1px solid;
		justify-content: flex-end;
		align-items: space-between;
	}
	/* 아래 nav */
	.header_wrap2 nav{
		display:flex;
		border-bottom : 1px solid;
		justify-content: space-between;
		align-items: center;
	}
	
	.header_logo{
		border : 1px solid;
	}
	.header_nav{
		display:flex;
		justify-content: flex-end;
	}

	.header_ul{
		margin:0 auto;
		padding:0 auto;
		width:700px;
	}
	
	.header_ul li{
		float:right;
		border : 1px solid;
		list-style: none;
		display:inline-block;
		width:140px;
		height:30px;
		text-align:center;
		margin-right:10px;
	}
	
	.header_ul li a{
		font-size:15px;
		display:inline-block;
		text-decoration: none;
		height:auto;
		color:black;
		font-weight:bold;
		margin-top:3px;
	}
	
	/* 맨 위 사이드*/
	.side_a{
		padding:5px;
		color:black;
		text-decoration:none;
		font-weight:bold;
	}

	
	/* 검색 모달 */
	.modal {
	    display: none; 
	    position: fixed; 
	    z-index: 1; 
	    left: 0;
	    top: 0;
	    width: 100%; 
	    height: 100%;
	    overflow: auto;
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}

	.modal-content {
	    position: relative;
	    background-color: #fefefe;
	    margin: auto;
	    padding: 0;
	    border: 1px solid #888;
	    width: 80%;
	    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	    -webkit-animation-name: animatetop;
	    -webkit-animation-duration: 0.4s;
	    animation-name: animatetop;
	    animation-duration: 0.4s
	}

	@-webkit-keyframes animatetop {
	    from {top:-300px; opacity:0} 
	    to {top:0; opacity:1}
	}

	@keyframes animatetop {
	    from {top:-300px; opacity:0}
	    to {top:0; opacity:1}
	}

	.close {
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}

	.close:hover,
	.close:focus {
	    color: #000;
	    text-decoration: none;
	    cursor: pointer;
	}

	.modal-header {
	    padding: 2px 16px;
	    background-color: #fefefe;  
	}

	.modal-body {
		padding: 2px 16px;
		text-align:center;
	}

	.modal-footer {
	    padding: 2px 16px;
	}

	/* 검색 폼 */
	#search_form select{
		height:25px;
	}
	
	#search_input{
		height: 20px;
		width:300px;
	}
	
	#search_input_button{
		width:70px;
	}
	

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function todayTime(){
		var clock = document.getElementById("clock");
		var now_date = new Date();
		var now_Time = now_date.getFullYear()+"/"+(now_date.getMonth()+1)+"/"+now_date.getDate()+"&nbsp;&nbsp;"+now_date.getHours()+"시 "
							+now_date.getMinutes()+"분 "+now_date.getSeconds()+"초";
		
		clock.innerHTML= now_Time;
		setTimeout("todayTime()",1000);
	}
	
	window.onload = function(){
		todayTime();
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 맨위 헤더 -->
	<div class="header_wrap1">
		<nav>
			<div style="display:flex; width:400px">
				<div style="text-align:center; margin-right:40px;">
					<span id="clock"></span>
				</div>
				
				<% if(session.getAttribute("email")==null){ %>
				<div class="header_nav_side">
					<a class="side_a" href="loginForm">로그인</a>
					<a class="side_a" href="joinForm">회원가입</a>		
				<!-- 관리자인 경우 보여줌, 임시 레벨 지정 -->
				<% }else if((Integer)session.getAttribute("level_no")==1){ %>
					<a class="side_a" href="adminMemberList?pageNum=1">관리자</a>
					<a class="side_a" href="logout">로그아웃</a>
				<!-- 로그인했을 경우 -->
				<% } else{  %>
					<a class="side_a" href="">마이페이지</a>
					<a class="side_a" href="logout">로그아웃</a>
			<% } %>
				</div>
			</div>
		</nav>
	
	</div>
	
	<!-- 제일 바깥 -->
	<div class="header_wrap2">
		<nav>
			<div class="header_logo">
				<a href="main.do"><img src="resources/qs.PNG" style="width:150px; height:30px;"/></a>
			</div>
			<div class="header_nav">
				<ul class="header_ul">
					<li><a href="productlist?pageNum=1&auctionType=1">일반경매</a></li>
					<li><a href="">블라인드 경매</a></li>
					<li><a href="">마감임박</a></li>
					<li><a href="">인기경매</a></li>
				</ul>
				<div><button id="myBtn" style="width:50px; height:28px;">
						<!--<img src="resources/qs.PNG" style="width:40px; height:28px; margin-right:50px; object-fit: cover;" >-->
						검색
					</button>
				</div>	
			</div>
			<!-- 로그인을 하지 않았을 경우 보여주는 div -->
			
		</nav>
		
	</div>

<!-- 검색 모달  -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">X</span>
      <h2>검색</h2>
    </div>
    <div class="modal-body">
      <form action="" method="post" id="search_form">
      	<select name="category">
      		<option>일반 경매</option>
      		<option>블라인드 경매</option>
      	</select>
      	<input id="search_input" type="text" name="search" placeholder="검색어를 입력하세요">
      	<input id="search_input_button" type="submit" value="검색">
      	<br><br>
      </form>
    </div>
    <div class="modal-footer">
    </div>
  </div>
</div>
<script>
	var modal = document.getElementById('myModal');
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	span.onclick = function() {
	    modal.style.display = "none";
	}
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
</script>
	
</body>
</html>



