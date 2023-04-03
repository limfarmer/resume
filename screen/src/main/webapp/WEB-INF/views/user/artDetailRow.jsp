<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="container-md col-md-9 mt-3 d-flex" id ="document">
		<div class="col-3" >
			<c:set value ="${detail}" var ="art"/>
				<img class="detailImg" src="${art.linkAddress}">
				<button class="bttn-bordered bttn-xs bttn-primary">보러가기</button>
				<div style="display:none;">${art.seqno}</div>
				<h1 style="display:inline-block;">${art.name}</h1>
				<div style="display:inline-block;">연재중</div>
				<h3>${art.author}</h3>
				<div>평균 평점 : ★★★★★</div>
				<a href="#">#스토리</a><a href="#">#드라마</a>
				<div style='overflow:scroll; height:20%'>${art.detail}</div>
		</div>
		<div class="d-flex col-9 flex-column" >
		<c:set value="${sess_id}" var ="user"/>
				<div class="w-75 pt-3 ms-5">
					<!-- 댓글 리스트 -->
					<div class="replyCard col-12 align-items-start  border border-bottom-warning">
						<div class="replyHead">
						</div>
					</div>
					<!-- 등록 버튼 -->
					<div class="col-7 pl-3 pt-3 " >
						<input id="addComment" class="col-9 h-75"></textarea>
						<button id="addReplyBtn" class = "btn btn-warning">댓글 등록</button>
					</div> 
				</div>
		</div>
	</div>
</div>



<!-- 댓글 모달 -->
<div id = "reply_modal" >
   <div class="reply_content"> 
      <div class="replyPopup">
         <input id="comment" class= "col-7" name="content" type="text">
	      <input id="modifyConfig"  class= "delete" type="submit" value = "수정">
      </div>
      <div class = "d-flex justify-content-center">
      </div>
      <div id="close_reply">
      <button class="delete">삭제</button>
         <button id="modalColseBtn">닫기</button>
      </div>
   </div>
</div>

<script type="text/javascript" src="/js/reply.js"></script>
<script>

$(document).ready(function(){
	var id = '<c:out value="${sess_id}"/>'
	var seqno = '<c:out value="${art.seqno}"/>';
	var modal = $("#reply_modal");
	var modal_content = modal.find("input[name='content']");
 	showList();
	modal.hide();
 	console.log("ano값 널떠서 디버깅 " + seqno);
 	
 	 /* 수정버튼 클릭시 */
 	$(".replyCard").on("click","button",function(e){
 	 	var rno = e.target.value;
	console.log(" rno : " + rno);
	
	replyService.get(rno,function(data){
		console.log("REPLY GET DATA")
		console.log("댓글 " + rno + "번 내용 :" + data.content);
		modal_content.val(data.content);
		modal.data("rno", data.seqno);
		});
	modal.show();
}); 
/* 수정 모달에서 등록시 */
 	 $("#modifyConfig").on("click",function(e){
 		console.log("수정 확인기능 시작" );
 		 var reply = {seqno : modal.data("rno"),
 					 content : modal_content.val()};
 		console.log("content 값 : "+ modal_content.val());
 		console.log("reply 값 : "+modal.data("rno"));
 		replyService.modify(reply,function(result){
 			alert(result);
 			modal.hide();
 			showList();
 			}); 
 	});  
	/* 삭제 버튼 클릭시 */
 	$(".delete").on("click",function(e){
		var rno = modal.data("rno");
		console.log("댓글 삭제 번호 : " + modal.data("rno"));
		replyService.remove(rno,function(result){
				alert(result);
				modal.hide();
				showList();
			}); 
	});
 	/* 댓글 리스트 출력 */
	function showList(){
		replyService.getReply(seqno,function(list){
			console.log("시퀀스 : "+seqno);
			console.log("리스트 내용" +list.length); 
				for(var i= 0, len=list.length || 0; i < len; i++){
					console.log(list[i]);
				}
				if(list == null || list.length==0){
					$(".replyCard").html("");
					return;
				}
				var str="";
					 if(list[0].id == id){
						 console.log('list 시퀀스 : ' + list[0].seqno)
						 str +='<button class="modify1 " value="'+list[0].seqno+'">수정</button>';
				}
				for(var i= 0, len=list.length || 0; i < len; i++){
					
					console.log("id : "+ id); 
					/* str += "<li data-rno='" +list[i].seqno+"'> <div class='replyRow'>" + list[i].rn + " | " + list[i].id;
					str += " | " + list[i].wdate + " | " + list[i].content + "</div></li>" */
					str += '<div class="replyHead">'
						str += '<strong > '+ list[i].id +'</strong> <small> '+ list[i].wdate +'</small>'
					str += '</div>'
					str += '<p name="content">'+ list[i].content +'</p>'
					} 
					/* 등록버튼 */
					/* str += '<div class=" d-flex  justify-content-center" >'
					str += '<input id="addComment" class="col-9 h-75"></textarea>'
					str += '<button id="addReplyBtn" class = "btn btn-warning p-0">댓글 등록</button>'
					str += '</div>' */
				$(".replyCard").html(str); 
		});
	}/* showList 끝 */

	/* 댓글 수정 버튼*/
 
	<!-- 등록 버튼 -->
    $('#addReplyBtn').on("click",function(e){
       var comment = document.getElementById("addComment").value;
       console.log("comment 넘어",comment);
       var replyadd = {
   			art_seqno : seqno , 
   			id : id ,
   			content : comment
   		} 
 		
       replyService.add(replyadd , function(result){
			alert("댓글이 등록 되었습니다." + result);
			document.getElementById("addComment").value = "";
			showList();
		});
       
    });

	 <!-- 모달 닫기 버튼 -->
     $("#modalColseBtn").on("click",function(e){
         
        modal.hide();
     });
});
</script>




