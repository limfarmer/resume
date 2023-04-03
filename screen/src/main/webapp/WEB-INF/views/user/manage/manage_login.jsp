<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.login {
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	
	display: block;
	
	padding: 10px;
	
	text-align:center;
}

</style>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<title>관리자 로그인</title>
</head>
<body>
<div class="login">
<div class="loginContainer" style="width:900px;height:100%;">
	<div class="form sign-in-container">
		<form method="post" action="/login?type=admin">
			<h1>로그인</h1>
			<div class="social-container">
				<a href="#"><i class="fab fa-facebook-f"></i></a>
				<a href="#"><i class="fab fa-google-plus-g"></i></a>
				<a href="#"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<input name="id" type="text" value="shiri" placeholder="아이디를 입력해주세요">
			<input name="pw" type="password" value="1234" placeholder="패스워드를 입력해주세요">
			<a href="#">아이디/패스워드 찾기</a>
			<button>로그인</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right" style="padding:0;">
				<p>관리자가 아니신가요?</p>
				<button class="signup_btn" onclick="location.href='../main.jsp'">메인페이지 가기</button>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>