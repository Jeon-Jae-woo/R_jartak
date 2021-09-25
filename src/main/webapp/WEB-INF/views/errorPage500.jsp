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
}
</style>

</head>
<body>
	<%@ include file="header.jsp"  %> 
     <div class="error-container">
			<lottie-player src="https://assets1.lottiefiles.com/packages/lf20_snbbsmgt.json"  background="transparent"  speed="0.5"  style="width: 800px; height: 700px;"  loop  autoplay></lottie-player>
      </div>
</body>
</html>