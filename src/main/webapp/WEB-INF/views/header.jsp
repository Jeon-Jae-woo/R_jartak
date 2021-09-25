<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	
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

<link href="resources/css/header.css" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>


</head>
<body>
    <div class="top">
        <div class="time">
            <span class="date"></span>
            &nbsp;&nbsp;
            <span class="hms"></span>
            <span class="ampm"></span>
        </div>
        

        <div class="top-right">
        <% if(session.getAttribute("email")==null){ %>
       	
	        <span class="top-session"><a class="" href="loginForm">로그인</a></span>
       		<span class="top-session"><a class="" href="joinForm">회원가입</a></span>

			<!-- 관리자인 경우 보여줌, 임시 레벨 지정 -->
			<% }else if((Integer)session.getAttribute("level_no")==1){ %>
			<span class="top-session"><a class="" href="adminMemberList?pageNum=1">관리자</a></span>
       		<span class="top-session"><a class="" href="logout">로그아웃</a></span>

			<!-- 로그인했을 경우 -->
			<% } else{  %>
			<span class="top-session"><a class="" href="mypage.do?email=user01@final.com">마이페이지</a></span>
			<span class="top-session"><a class="" href="logout">로그아웃</a></span>

			<% } %>	     
	    </div>
        
    </div>
    <nav>
        <div class="nav-content">
            <a href="main2.do"><img class="logo-image" src="resources/images/logo.png" alt="logo"></a>
            <a href="main2.do" class="logo-word">알잘딱</a>
            <span class="logo-description">화상 채팅 경매 서비스</span>

            <div class="nav-right">
                <ul class="nav-links">
                    <li><a href="productlist?pageNum=1&type=4">인기경매</a></li>
                    <li><a href="productlist?pageNum=1&type=3">마감임박</a></li>
                    <li><a href="productlist?pageNum=1&type=2">블라인드 경매</a></li>
                    <li><a href="productlist?pageNum=1&type=1">일반경매</a></li>
                </ul>
                <button class="nav-search"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </nav>

<!-- 검색 모달  -->
<div id="myModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">X</span>
      <h2>검색</h2>
    </div>
    <div class="modal-body">
      <form action="searchfor.do" method="post" id="search_form">
      	<input type="hidden" name="pageNum" value=1>
      	<select name="category">
      		<option value="1">일반 경매</option>
      		<option value="2">블라인드 경매</option>
      	</select>
      	<input id="search_input" type="text" name="search" placeholder="검색어를 입력하세요" >
      	<input id="search_input_button" type="submit" value="검색">
      	<br><br>
      </form>
    </div>
   	<div class="modal-footer">
    </div>
  </div>
</div>



<script>
    function updateTime() {
        var dateInfo = new Date();

        /* time */
        var hr,
            _min = (dateInfo.getMinutes() < 10) ? "0" + dateInfo.getMinutes() : dateInfo.getMinutes(),
            sec = (dateInfo.getSeconds() < 10) ? "0" + dateInfo.getSeconds() : dateInfo.getSeconds(),
            ampm = (dateInfo.getHours() >= 12) ? "PM" : "AM";

        // replace 0 with 12 at midnight, subtract 12 from hour if 13–23
        if (dateInfo.getHours() == 0) {
            hr = 12;
        } else if (dateInfo.getHours() > 12) {
            hr = dateInfo.getHours() - 12;
        } else {
            hr = dateInfo.getHours();
        }

        var currentTime = hr + ":" + _min + ":" + sec;

        // print time
        document.getElementsByClassName("hms")[0].innerHTML = currentTime;
        document.getElementsByClassName("ampm")[0].innerHTML = ampm;

        /* date */
        var dow = [
            // "Sunday",
            // "Monday",
            // "Tuesday",
            // "Wednesday",
            // "Thursday",
            // "Friday",
            // "Saturday"
            "일요일",
            "월요일",
            "화요일",
            "수요일",
            "목요일",
            "금요일",
            "토요일"
        ],
            month = [
                // "January",
                // "February",
                // "March",
                // "April",
                // "May",
                // "June",
                // "July",
                // "August",
                // "September",
                // "October",
                // "November",
                // "December"
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월"
            ],
            day = dateInfo.getDate();

        // store date
        var currentDate = "2021년 " + month[dateInfo.getMonth()] + " " + day+ "일 " + dow[dateInfo.getDay()];

        document.getElementsByClassName("date")[0].innerHTML = currentDate;
    };

    // print time and date once, then update them every second
    updateTime();
    setInterval(function () {
        updateTime()
    }, 1000);
</script>
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



