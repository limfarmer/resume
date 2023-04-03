<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 나중에 web으로 옮기기 -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<!-- <script>
$(window).scroll(function() {

```
var scrolltop = $(document).scrollTop();
var height = $(document).height();
var height_win = $(window).height();

```

if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
alert('d');
}
}
</script> -->

<%@ include file="head.jsp" %>
<title>평가하기</title>
</head>
<body onload="init()">
<%@ include file="header.jsp" %>

<div class="container-md col-md-9 mt-3" id="document">
<h2> 하여튼 뭔가 간지나고 평가를 독려하는 문구 </h2>
<%@ include file="ratingContent.jsp" %>
<div id="second"></div>
</div>
<%@ include file="footer.jsp" %>
<%@ include file="reply_modal.jsp" %>
</body>
</html>