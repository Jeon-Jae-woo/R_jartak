<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
<style type="text/css">
.header {
	background-color: gray;
	width: 1000px;
	height: 100px;
}

.main{
	width: 1000px;
	
	
}

.category {
	background-color: lightgreen;
	width: 100%;
	height: 500px;
	padding: 10px 10px 0px 0px;
	position: relative;
}

.loginForm h2 {
	text-align: center;
	margin: 30px;
}

.idForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.passForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.id {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.pw {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
	background-position: left;
	background-size: 200%;
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}

.search {
	height: 40px;
	width: 400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
	position: relative;
	left: 20%;
}

.search-box {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.search-btn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #1b5ac2;
	outline: none;
	float: right;
	color: #ffffff;
}

.loginForm {
	position: relative;
	width: 300px;
	height: 350px;
	padding: 30px, 20px;
	background-color: #3c3c3c;
	text-align: center;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.notice {
	background-color: #3c3c3c;
	width: 540px;
	height: 320px;
	position: relative;
	left: 200px;
	bottom: 525px;
	border-radius: 15px;
	padding:8px 30px 30px 30px;
}

.upbox {
	position: relative;
	width: 100%;
	height: 70%;
	top: 30%;
	left: 20%;

}

/* .notice-ul{
	list-style: none;
    margin: 0px;
    padding: 0px;
    max-width: 250px;
    width: 100%;
    
	
} */



/* 게시판 목록 */
.board {width: 950px; }
.w500 {width:500px; }
.w100 {width:100px; }
.title {
	height: 50px;
	line-height: 50px;
	background:white;
	font-weight: bold;
	border-radius: 30px;
}
.t_line {border-right:solid 1px gray;}
.lt_line {border-bottom:solid 1px gray;}
.list {
	height: 40px;
	line-height: 40px;
	background: #f3f3f3;
}

.hot-trade table{
	float:left;
	width:25%;
}

.deadline-trade table{
	float:left;
	width:25%;
	top:20px;
	
}

.thumbnail{
	position:relative;
	width: 800px;
	height: 700px;
	left: 10px;
}

.thumbtitle{
	text-align:center;
	width:150px;
	margin:0px 0px 20px 0px;
	border-width:2px;
	border-style:dash;
	border-color:black;
	
}

th{
	width:200px;
	height: 200px;
}

</style>
</head>
<body>

	<!-- 로그인/공지/검색 -->
<div class="main">
<div class="header"></div>
	<div class="category">
		<div class="upbox">
			<form action="" method="post">
				<div class="loginForm">
					<h2>Login</h2>
					<div class="idForm">
						<input type="text" class="id" placeholder="ID">
					</div>
					<div class="passForm">
						<input type="password" class="pw" placeholder="PW">
					</div>
					<button type="submit" class="btn" onclick="button()">LOG
						IN</button>
				</div>
			</form>

			<div class="notice">
				<ul class="board">
					<li class="fl tc w500 title t_line"><a>제목</a><span>/2021-08-24</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a>제목</a><span>/2021-08-24</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a>제목</a><span>/2021-08-24</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a>제목</a><span>/2021-08-24</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a>제목</a><span>/2021-08-24</span></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="search">
			<input type="text" placeholder="검색어 입력" class="search-box"> <input
				type="button" value="검색" class="search-btn">
		</div>

	</div>
	
	<br>
	
	
	
	<!-- 카테고리별 썸네일 -->
	
	<div class="thumbnail">
		<h2  class="thumbtitle">인기 경매</h2>
		<div class="hot-trade">
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
		</div>

		<br>
		
		
		<div class="deadline-trade">
			<h2 class="thumbtitle">마감 임박</h2>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
			<table border="1">
				<tr>
					<th colspan="2">IMG</th>
				</tr>
				<tr>
					<td colspan="2">Trade name</td>
				</tr>
				<tr>
					<td>count</td>
					<td>view</td>
				</tr>
				<tr>
					<td colspan="2">seller</td>
				</tr>
			</table>
		</div>
	</div>
</div>	
	
	
	

<%@ include file="footer.jsp"  %>	
</body>
</html>