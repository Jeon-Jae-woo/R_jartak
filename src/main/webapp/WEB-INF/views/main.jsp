<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"></script>
<style type="text/css">

	.center{
		width:1000px;
		text-align:center;
		overflow: hidden;
		
	}
	.category{
		background-color:lightgreen;
		width:100%;
		height:400px;
		padding:10px 10px 0px 0px;
		
	}
	
	.trade-cate{
		border: 5px solid darkblue;
		border-radius:25px 25px 25px 25px;
		border:2px;
		color:white;
		background-color:#282828;
		text-size:20px;
	}
	.cate-table{
		border-spacing:40px;
	}
	.center-box.login{
		background-color:#505050;
	}
	.center-box{
		width:50%;
		height:350px;
		float:left;
		
	}
	

</style>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"  %>	

<div class="category">
	<div class="center">
		<div class="center-box table">
			<table class="cate-table">
			<tr>
				<th colspan="2"><input type="button" value="검색"><input type="search"></th>
			</tr>
				<tr>
				<th class="trade-cate" id="normal">일반 경매</th>
				<th class="trade-cate" id="blind">블라인드 경매</th>
				</tr>
			</table>
		</div>
		<div class="center-box login">
		</div>
	</div>
	
</div>

<%@ include file="footer.jsp"  %>	
</body>
</html>