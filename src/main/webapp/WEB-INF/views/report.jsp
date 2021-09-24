<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	#report_wrap{
		text-align:left;
	}
	
	#button_style{
		text-align:center;
	}
	
	.form_label{
		font-size:13px;
		padding-bottom:3px;
	}
	
</style>


<title>report</title>
</head>
<body>
	<form action="reportIn.log" method="post">
		<input type="hidden" name="email" value=""><!-- value에 넘어온 값 세팅, 신고한 유저 이메일 -->
		<div id="report_wrap">
			<h2 style="text-align:center">신고하기</h2>
			<hr>
			<div class="form_label">
				<label for="reportTitle">제 목</label>
			</div>
			<div>
				<input type="text" placeholder="제목을 입력하세요" name="report_title">
			</div>
			<hr>
			<div class="form_label">
				<label>신고사유</label>
			</div>
			<div>
			<select name="report_type">
				<option value="부적절한 게시물">부적절한 게시물</option>
				<option value="광고 및 홍보">광고 및 홍보</option>
				<option value="기타">기타</option>
			</select>
			</div>
			<br>
			<div class="form_label"><label>신고 내용</label></div>
			<div>
				<textarea rows="7" cols="40" placeholder="신고 내용을 입력하세요" name="report_content"></textarea>
			</div>
			<hr>
			<div class="form_label"><label>신고 유저</label></div>
			<div>
				<input type="text" value="${targetNickname}" readonly="readonly" name="target_nickname"/>
			</div>
			<hr>
			
		</div>
		<div id="button_style">
			<input type="submit" value="신고하기">
			<input type="button" value="취소" onclick="window.close();">
		</div>
	</form>
</body>
</html>