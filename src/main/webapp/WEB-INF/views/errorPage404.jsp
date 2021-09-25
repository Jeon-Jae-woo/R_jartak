<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알잘딱 - 화상 채팅 경매 서비스</title>
<link rel="icon" type="image/png" sizes="32x32" href="resources/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<style>
.error-container {
    position: absolute;
    top: 15%;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
}

h1 {
	margin: 0;
	padding: 0;
}
</style>

</head>
<body>
	<%@ include file="header.jsp"  %> 
     <div class="error-container">
      		<lottie-player src="https://assets5.lottiefiles.com/private_files/lf30_bdec2jzh.json"  background="transparent"  speed="1"  style="width: 700px; height: 500px;"  loop  autoplay></lottie-player>
      		<h1>Page Not Found</h1>
      </div>
</body>
</html>