<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../head.jsp" %>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
<title>평가한 작품보기</title>
</head>
<body onload="init()">
<div class="container-md col-md-9 mt-5">
		<!-- 돌아가기 버튼 -->
	<div class="back">
		<a href="mypage.jsp">돌아가기</a>
	</div>
	
	<div class="choice">
		<button type="button" class="choiceRanking on">
			별점별 작품 <!-- 별점순,등록순에 색넣고 클릭시 밑에 보드들도 그색으로 바뀌게하기 생각중 -->
		</button>
		<button type="button" class="choiceUpdate">
			평가 등록순
		</button>
	</div>
	<!-- 목록 -->
<div class="checkArtResult">
</div>

</body>
<script type="text/javascript" src="../js/checkArt.js"></script>
<script>
$(document).ready(function(){
	
	$(document).ready(function(){
		$("button").on('click',function(){
					$(this).addClass("on");
					$(this).siblings("button").removeClass("on");
				});
	});
	
	var id ='<%= (String)session.getAttribute("sess_id")%>';
	 $('.choiceRanking').on('click',function(key){
		showList();
	 });
	
	$('.choiceUpdate').on('click',function(key){
		showListDate();
	});
	function showList(){
	checkArtService.getArtList(id,function(list){
		var str = "";
		if(list == null || list.length==0){
			$(".checkArtResult").html("검색 결과가 없습니다");
			return;
		}  
		
			for(var i = 0, len=list.length || 0; i<len; i++){
				str+="<div class='d-flex justify-content-center' style='border-bottom: 1px solid lightgrey;padding-bottom: 3%;'>"
				str+="<div class='col-3'>"
				str+=	"<div class='image'><img src='"+list[i].linkAddress+"' style='"
				str+= "height: 100%;"
				str+= "width: 100%;'></div>"
				str+="</div>"
				str+="<div class='col-6 ps-3'>"
				str+=	"<div class='checkTitle'>"+list[i].name+"</div>"
				str+=	"<div class='checkReply'>"
				str+=		"<p>댓글:</p>"
				str+=		"<span>"+list[i].detail+"</span>"
				str+=		"<div class='checkTag'>"
				str+=			"<a class='tag' href='#'></a>"
				str+=		"</div>"
				str+=	"</div>"
				str+="</div>"
				str+="<div class='col-3'>"
				str+=	"<div class='star'>"
				str+=		"<div>"
				str+=		"<h4>나의 평점</h4>"
				str+=		"<span>/평균 평점</span>"
				str+=		"</div>"
				str+=		"<div>"
				str+=		"<h2>"+list[i].avgRating+"</h2>"
				str+=		"<span>/5.0</span>"
				str+=		"</div>"
			    str+=	"</div>"
				str+="</div>"
				str+="</div>"
			}
			$(".checkArtResult").html(str);
		})
	};
	
	function showListDate(){
	checkArtService.getArtListDate(id,function(list){
		var str = "";
		if(list == null || list.length==0){
			$(".checkArtResult").html("검색 결과가 없습니다");
			return;
		}  
		
			for(var i = 0, len=list.length || 0; i<len; i++){
				str+="<div class='d-flex justify-content-center' style='border-bottom: 1px solid lightgrey;padding-bottom: 3%;'>"
				str+="<div class='col-3'>"
				str+=	"<div class='image'><img src='"+list[i].linkAddress+"' style='"
				str+= "height: 100%;"
				str+= "width: 100%;'></div>"
				str+="</div>"
				str+="<div class='col-6 ps-3'>"
				str+=	"<div class='checkTitle'>"+list[i].name+"</div>"
				str+=	"<div class='checkReply'>"
				str+=		"<p>댓글:</p>"
				str+=		"<span>"+list[i].detail+"</span>"
				str+=		"<div class='checkTag'>"
				str+=			"<a class='tag' href='#'></a>"
				str+=		"</div>"
				str+=	"</div>"
				str+="</div>"
				str+="<div class='col-3'>"
				str+=	"<div class='star'>"
				str+=		"<div>"
				str+=		"<h4>나의 평점</h4>"
				str+=		"<span>/평균 평점</span>"
				str+=		"</div>"
				str+=		"<div>"
				str+=		"<h2>"+list[i].avgRating+"</h2>"
				str+=		"<span>/5.0</span>"
				str+=		"</div>"
			    str+=	"</div>"
				str+="</div>"
				str+="</div>"
			}
			$(".checkArtResult").html(str);
		})
	};
	
	showList();
});
</script>
</html>