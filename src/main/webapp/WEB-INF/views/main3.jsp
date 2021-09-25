<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">




</script>
<link href="resources/css/main33.css" rel="stylesheet"/>
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
					<table>
						<tr>
							<th rowspan="3"><img src="resources/userIcon.png"></th>
							<th colspan="2">${dto.nickname }</th>
						</tr>
						<tr>
							<td colspan="2"><a href="mypage.do?email="${dto.email }>내정보</a></td>
						</tr>
						<tr>
							<td colspan="2">${rankDto.rank_name }</td>
						</tr>
						<tr>
							<td colspan="2"></td>
							<td><input type="button" value="로그아웃"></td>
						</tr>
					</table>
				</div>
			</form>
		<!-- <ul class="board">
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
				</ul> -->
				
			<div class="notice">
				<c:choose>
					<c:when test="${empty productList }">
							<div>등록된 관심상품이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${productList }" begin="0" end="4">
						<ul class="board">
							<li class="fl tc w500 title t_line">${list.auction_title }<span>/${list.remainingTime }</span></li>
						</ul>
						</c:forEach>
					</c:otherwise>	
						
				</c:choose>
				
				
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
			<a>전체보기</a><br>
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
			<a>전체보기</a><br>
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