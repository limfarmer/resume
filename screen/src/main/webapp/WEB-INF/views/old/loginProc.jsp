<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("login", "ok");
%>
<script>
alert('로그인되었습니다.');
location.href='main.jsp';
</script>