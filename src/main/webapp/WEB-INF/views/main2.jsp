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
<link href="resources/css/main2.css" rel="stylesheet"/>
</head>
<body>

<%@ include file="header.jsp"  %> 

	<!-- 로그인/공지/검색 -->
<div class="main">
<!-- <div class="header"></div> -->
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