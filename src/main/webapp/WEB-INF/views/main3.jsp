<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
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