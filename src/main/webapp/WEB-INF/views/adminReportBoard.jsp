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
	
	.reportuser{
		display:flex;
		justify-content: space-between;
	}
	
</style>


<title>report</title>
</head>
<body>
	<form action="" method="post">
		<div id="report_wrap">
			<h2 style="text-align:center">신고내역</h2>
			<hr>
			<div class="form_label">
				<label for="reportTitle">제 목</label>
			</div>
			<div>
				<input type="text" name="reportTitle" readonly="readonly" style="width:45%;">
			</div>
			<hr>
			<div class="form_label">
				<label>신고사유</label>
			</div>
			<div>
			<div>
				<input type="text" name="report" readonly="readonly" style="width:45%;">
			</div>
			</div>
			<br>
			<div class="form_label"><label>신고 내용</label></div>
			<div>
				<textarea rows="7" cols="40" readonly="readonly"></textarea>
			</div>
			<hr>
			
			<div class="reportuser">
				<div class="">
					<div class="form_label"><label>신고 대상</label></div>
					<div>
						<input type="text" value="" readonly="readonly"/>
					</div>
				</div>
				<div class="">
					<div class="form_label" style="margin-right:30%"><label>신고자</label></div>
					<div style="margin-right:10%">
						<input type="text" value="" readonly="readonly"/>
					</div>
				</div>
			</div>
			<hr>
			
		</div>
		<div id="button_style">
			<input type="button" value="닫기" onclick="window.close();">
		</div>
	</form>
</body>
</html>