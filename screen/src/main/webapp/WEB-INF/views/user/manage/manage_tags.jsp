<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지-태그관리</title>
<%@ include file="manage_head.jsp"%>
</head>

<body onload="init()" class="nav-md" id="nav_body">
<input type="hidden" name="msg" value="<%=request.getAttribute("msg") %>">
	<div class="container body">
		<div class="main_container">
			<%@ include file="manage_sidebar.jsp"%>
			<%@ include file="manage_topnav.jsp"%>
			<%@ include file="manage_tagList.jsp"%>
		</div>
	</div>
</body>

<script>
function init() {
	const msg = document.getElementsByName("msg");
	if (msg[0].value === "InsertSuccess") {
		alert("태그가 추가되었습니다.");
	} else if (msg[0].value === "ModifySuccess") {
		alert("태그가 수정되었습니다.");
	} else if (msg[0].value === "DuplicateTag") {
		alert("기존에 있는 태그 이름입니다.");
	}
}
</script>
</html>