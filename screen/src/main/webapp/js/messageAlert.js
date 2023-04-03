function init() {
	const msg = document.getElementsByName("msg");
	if (msg[0].value === "loginOk") {
		alert("관리자로 로그인되었습니다. 관리자 화면으로 이동합니다.");
	} else if (msg[0].value === "authFail") {
		alert("로그인되었습니다. 메인화면으로 이동합니다.");
	} else if (msg[0].value === "loginFail") {
		alert("아이디 혹은 패스워드를 확인해주세요.");
	}else if (msg[0].value === "logOut") {
		alert("로그아웃 되었습니다.");
	}
}

