<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form class="signUpForm">
	<h2>회원가입</h2>
	<label for="userId">아이디</label><input type="text" id="userId" name="userId">
	<label for="userPw">패스워드</label><input type="password" id="userPw" name="userPw">
	<label for="userPwConfirm">패스워드 확인</label><input type="password" id="userPwConfirm" name="userPwConfirm">
	<label for="userName">이름</label><input type="text" id="userName" name="userName">
	<label for="userEmail">이메일</label><input type="email" id="userEmail" name="userEmail">
	<input id="toggle-on" class="toggle toggle-left" name="toggle" value="F" type="radio" checked>
	<label for="toggle-on" class="btn">여성</label>
	<input id="toggle-off" class="toggle toggle-right" name="toggle" value="M" type="radio">
	<label for="toggle-off" class="btn">남성</label>
	<div>
	<input type="submit" value="회원가입">
	<input type="reset" value="다시쓰기">
	</div>

</form>