<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="loginContainer">
	<div class="form sign-in-container">
		<form method="post" action="/login?type=user">
			<h1>로그인</h1>
			<div class="social-container">
				<a href="#"><i class="fab fa-facebook-f"></i></a>
				<a href="#"><i class="fab fa-google-plus-g"></i></a>
				<a href="#"><i class="fab fa-linkedin-in"></i></a>
			</div>
			<input name="id" type="text" placeholder="아이디를 입력해주세요" value="user5">
			<input name="pw"  type="password" placeholder="패스워드를 입력해주세요" value="1234">
			<a href="#">아이디/패스워드 찾기</a>
			<button>로그인</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-right">
				<h1>회원가입</h1>
				<p>아직 회원이 아니신가요?</p>
				<button class="signup_btn">회원가입하러가기</button>
			</div>
		</div>
	</div>
</div>
