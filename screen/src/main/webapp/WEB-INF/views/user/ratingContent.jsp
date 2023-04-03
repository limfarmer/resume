<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ratingContainer">
</div>
<!-- 댓글 모달 -->
<div id="reply">
	<div id = "reply_modal d-flex">
		<div class="reply_content  justify-content-center ">
			<input id="comment" name="content" class="col-10"type="text" style="height:50%; margin-left: 8%;" placeholder="한줄평을 남겨주세요.">
			<div class="col-10 mt-1 " style="height:10%; margin-left:40%;">
				<button id="modifyConfig" class="btn btn-outline-primary">등록</button>
				<button id="modalColseBtn"class="btn btn-outline-primary">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 스크립트 -->
<script type="text/javascript" src="/js/rating.js"></script>
<script type="text/javascript" src="/js/reply.js"></script>
<script>
var id = '<c:out value="${sess_id}"/>'
var modal = $("#reply");
var modalVal = modal.find("input[name='content']");
$(document).ready(function(){
showRatingList();
modal.hide();
	

	function showRatingList(){
		ratingService.list(id,function(list){
			if(list == null || list.length==0){
				$(".ratingContainer").html("모든 작품을 평가하셨어요!");
				return;
			}
			var str=""
			for(var i= 0, len=list.length || 0; i < len; i++){
				/* console.log("list.name : ",list[i].name); */
				str+='<div class="row align-items-start mt-5">'
					str+='<div class="ratingImg col-2">'
						str+='<a href="/artDetail/detail?seqno='+list[i].seqno+'"><img src="'+ list[i].imageRoute +'"></a>'
					str+='<input type="hidden" id = "tagSeq" value="'+list[i].seqno+'">'
					str+='</div>'
					str+='<div class="tests col-10">'
						str+='<div class="ratingReply justify-content-start">'
							str+='<h1 class="ratingTitle">'+list[i].name+'</h3>'
							str+='<h4 class="ratingArtist mt-1">'+list[i].author+'</h4>'
						str+='</div>'
						/* 별점부분 */
						str+='<div class="row align-items-start justify-content-between">'
							str+='<div class="rating-group col-11 mt-2">'
								str+='<input class="rating__input rating__input--none ch" checked name="rating2" id="rating2-0" value="0" type="radio">'
								str+=' <label aria-label="0 stars" class="rating__label" for="rating2-0">&nbsp;</label>'
								str+=' <label aria-label="0.5 stars" class="rating__label rating__label--half" for="rating2-05"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
								str+='<input class="rating__input" name="rating2" id="rating2-05" value="0.5" type="radio">'
						        str+=' <label aria-label="1 star" class="rating__label" for="rating2-10"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
					        	str+=' <input class="rating__input" name="rating2" id="rating2-10" value="1" type="radio">'
				        		str+=' <label aria-label="1.5 stars" class="rating__label rating__label--half" for="rating2-15"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
						        str+=' <input class="rating__input" name="rating2" id="rating2-15" value="1.5" type="radio">'
					        	str+=' <label aria-label="2 stars" class="rating__label" for="rating2-20"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
			       				str+='<input class="rating__input" name="rating2" id="rating2-20" value="2" type="radio">'
			        			str+='<label aria-label="2.5 stars" class="rating__label rating__label--half" for="rating2-25"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
			  					str+='<input class="rating__input" name="rating2" id="rating2-25" value="2.5" type="radio" checked>'
								str+='<label aria-label="3 stars" class="rating__label" for="rating2-30"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
								str+='<input class="rating__input" name="rating2" id="rating2-30" value="3" type="radio">'
								str+='<label aria-label="3.5 stars" class="rating__label rating__label--half" for="rating2-35"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
								str+='<input class="rating__input" name="rating2" id="rating2-35" value="3.5" type="radio">'
						        str+='<label aria-label="4 stars" class="rating__label" for="rating2-40"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
					        	str+=' <input class="rating__input" name="rating2" id="rating2-40" value="4" type="radio">'
						        str+='<label aria-label="4.5 stars" class="rating__label rating__label--half" for="rating2-45"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
				        		str+='<input class="rating__input" name="rating2" id="rating2-45" value="4.5" type="radio">'
						        str+='<label aria-label="5 stars" class="rating__label" for="rating2-50"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
					        	str+='<input class="rating__input" name="rating2" id="rating2-50" value="5" type="radio">'
			            		/* 버튼 아이콘 */
				        	str+='</div>'
				        	str+='<button id="icon" class="col-1">'
							str+='<ion-icon name="ellipsis-vertical-outline"></ion-icon>'
							str+='</button>'
	        			str+='</div>'
	        		str+='</div>'
        		/* 벌점끝 */
        		str+='</div>'
			}
			$(".ratingContainer").html(str);
		});
	}
	$('.ratingContainer').on('click','input',function(e){
		/* 	 var ch = $(this).parent().parent().parent().parent(".row").val(); 
			 var ch = $(this).children().children().children().children(".ch").val();  */
			 var starValue = e.target.value;
			 var artSeq = document.getElementById("tagSeq").value;
			 var ratingArt = {
					 id : id,
					 artSeqno : artSeq,
					 value : starValue
			 };
				console.log('star' ,starValue);
				ratingService.rating(ratingArt);
				alert('평가되었습니다.');
				 showRatingList(); 
				/* 페이지 새로고침되도록 고치기  */	
			});
	$('.ratingContainer').on('click','button',function(e){
		/* var button = e.target.value; */
		modal.show();
	});
	/* 댓글 달기 누를경우*/
	$("#modifyConfig").on("click",function(){
		var comment = document.getElementById("comment").value;
		var rseqno = document.getElementById("tagSeq").value;
		var replyadd = {
	   			art_seqno : rseqno , 
	   			id : id ,
	   			content : comment
	   		};
	console.log("rseqno",rseqno);
		console.log("id",id);
		console.log("comment",comment);
		console.log("replyadd",replyadd);
		replyService.add(replyadd);
		alert("댓글이 등록되었습니다. 해당 작품 페이지로 이동합니다.");
		window.location.href ="/artDetail/detail?seqno="+rseqno;
	});
	 <!-- 모달 닫기 버튼 -->
     $("#modalColseBtn").on("click",function(e){

        modal.hide();
     });

});


</script>