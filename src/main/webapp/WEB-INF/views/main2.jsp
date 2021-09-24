<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main2.css" rel="stylesheet"/>
<script type="text/javascript">
function loginCheck(){
	console.log("[LOGIN]");
	
	var email = $("#email").val().trim();
	var password = $("#password").val().trim();
	
	var loginInfo = {
			"email":email,
			"password":password
	};
	
	if(email==""||email==null||password==""||password==null){
		alert("아이디 혹은 비밀번호를 입력해 주세요");
		
	}else{
		$.ajax({
			type:"POST",
			url:"afterlogin.do",
			data:JSON.stringify(loginInfo),
			contentType:"application/json",
			dataType:"json",
			success:function(data){
				console.log(data.status_code);
				if(data.status_code=='UNAUTHORIZED'){
					alert("아이디 혹은 비밀번호를 잘못 입력했습니다");
				}else if(data.status_code=='OK'){
					location.href='main3.do';
				}
			},
			error:function(){
				alert("서버 에러");
			}
		});
	}
	
	
}

</script>


</head>
<body>

<%@ include file="header.jsp"  %> 

	<!-- 로그인/공지/검색 -->
<div class="main">
<!-- <div class="header"></div> -->
	<div class="category">
		<div class="upbox">
			<form action="/login" method="post">
			
				<div class="loginForm">
					<h2>Login</h2>
					<div class="idForm">
						<input type="text" class="id" placeholder="EMAIL" name="email" id="email">
					</div>
					<div class="passForm">
						<input type="password" class="pw" placeholder="PW" name="password" id="password">
					</div>
					<button type="button" class="btn" onclick="loginCheck();">LOGIN</button>
				</div>
			</form>

			<div class="notice">
				<ul class="board">
					<li class="fl tc w500 title t_line"><a href="">[공지]21일 서버점검완료</a><span>/2021-09-21</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a href="">[공지]마감임박경매 관련공지</a><span>/2021-09-11</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a href="">[공지]불량이용자 제재내역</a><span>/2021-09-01</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a href="">[공지]이용안내</a><span>/2021-08-27</span></li>
				</ul>
				<ul class="board">
					<li class="fl tc w500 title t_line"><a href="">[공지]경매등록시 안내</a><span>/2021-08-24</span></li>
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