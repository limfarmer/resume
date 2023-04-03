<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id = "reply">
	<div class="reply_content"> 
		<div class="replyPopup">
			<form method="post" action="#">
				<input type="text" name="serch" placeholder="댓글을 달아주세요.(50자 이내)" maxlength="50" required>
				<input type="submit" value="댓글달기" >	
			</form>
		</div>
		<div id="close_reply">
			<a href="javascript:reply_close()">닫기</a>
		</div>
	</div>
</div>

<script>
 function default1(){
	 document.getElementById("reply").style.display="block";
 }	
 function reply_close(){
	 document.getElementById("reply").style.display="none";
 } 
</script> --%>