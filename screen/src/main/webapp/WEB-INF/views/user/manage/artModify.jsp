<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정하기</title>
<%@ include file="manage_head.jsp" %>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
</head>
<body>
	<div class="x_panel">
		<div class="x_title">
			<h2>
				작품 수정하기
			</h2>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br>
			<form id="artModifyForm" class="form-horizontal form-label-left" enctype="multipart/form-data">
				<div class="row">
					<div class="col">
						<div class="form-group row ">
							<label class="control-label col-md-3 col-sm-3" style="display:block">
								대표 이미지
								 <!-- <span id="fileUpload" class="badge badge-success">파일 업로드</span> -->
								<div id="upload"></div>
								<span id="imageLink" class="badge badge-info">이미지 링크 삽입</span>
							</label>
							<div id="imageDiv" class="col-md-9 col-sm-9 imageDiv">
								<img id="image" class="form-control" src="${info.imageRoute}">
							</div>
						</div>
						</div>
					<div class="col">
						<div class="form-group row" style="position: relative;">
							<label class="control-label col-md-3 col-sm-3 ">
								작품명
							</label>
							<div class="col-md-9 col-sm-9 ">
								<input id="artName" type="text" class="form-control" value="${info.name}">
								<span class="badge badge-primary" data-field="artName">수정</span>
							</div>
						</div>
						<div class="form-group row " style="position: relative;">
							<label class="control-label col-md-3 col-sm-3 ">
								작가명
							</label>
							<div class="col-md-9 col-sm-9 ">
								<input id="author" type="text" class="form-control" value="${info.author}">
								<span class="badge badge-primary" data-field="author">수정</span>
							</div>
						</div>
						<div class="form-group row" style="position: relative;">
							<label class="control-label col-md-3 col-sm-3 ">
								작품설명
							</label>
							<div class="col-md-9 col-sm-9 ">
								<textarea id="detail" class="form-control" rows="3">${info.detail}</textarea>
								<span class="badge badge-primary" data-field="detail">수정</span>
							</div>
						</div>
						<!-- <div class="form-group row">
							<label class="control-label col-md-3 col-sm-3 ">
								연재처
								<span class="badge badge-primary" data-field="platform">수정</span>
							</label>
							<div class="col-md-9 col-sm-9 ">
								<select id="platform" class="form-control" >
								</select>
							</div>
						</div> -->
						<div class="control-group row">
							<label class="control-label col-md-3 col-sm-3 ">작품 태그 관리</label>
							<div class="col-md-9 col-sm-9 ">
								<input id="tags_1" type="text" class="tags form-control" value="social, adverts, sales" data-tagsinput-init="true" style="display: none;">
								<div id="artTag" class="tagsinput" style="width: auto; min-height: 100px; height: 100px;"></div>
								
								<!-- <div id="suggestions-container" style="position: relative; float: left; width: 250px; margin: 10px;"></div> -->
							</div>
						</div>
						<!-- <div class="ln_solid"></div>
						<div class="form-group">
							<div class="col-md-9 col-sm-9  offset-md-3">
								<button type="button" class="btn btn-primary">Cancel</button>
								<button type="reset" class="btn btn-primary">Reset</button>
								<button type="submit" class="btn btn-success">Submit</button>
							</div>
						</div> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script>
var seqno = "${seqno}";
console.log(seqno);

var artModify = (function(){
	
	function getInfo(callback, error){
 		console.log('getInfo called.. seqno:'+seqno);
 		//console.log('getInfo function:');
 		$.ajax({
 			type: 'get',
 			url : '/adminRest/getInfo/'+seqno,
 			contentType : 'application/json; charset=utf-8',
 			
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(){
 				if(error){
 					error(er);
 				}
 			}
 		});
 	}
	
	function setImageLink(imageLink, callback,error){
 		console.log('image link called... seqno:'+seqno);
 		//console.log('image link function:'+seqno);
 		$.ajax({
 			type:'post',
 			url:'/adminRest/setImageLink/'+seqno,
 			data: JSON.stringify(imageLink),
 			contentType: 'application/json; charset=utf-8',
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er){
 				if(error){
 					error(er);
 				}
 			}
 		
 		});
 	}
	
	function setImageFile(imageLink, callback,error){
 		console.log('image file called... seqno:'+seqno);
 		//console.log('image file function:'+seqno);
 		$.ajax({
 			type:'post',
 			url:'/adminRest/setImageLink/'+seqno,
 			data: JSON.stringify(imageLink),
 			contentType: 'application/json; charset=utf-8',
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er){
 				if(error){
 					error(er);
 				}
 			}
 		
 		});
 	}
	
	return {
		getInfo:getInfo,
		setImageLink:setImageLink
	};
})();

$(document).ready(function(){
	
	showInfo();
	
	$('#fileUpload').on('click', function(e){
		console.log('file upload click');
		$('#upload').html('<input type="file" name="imageInput" id="imageInput" accept="image/*">');
	});
	
	$('#imageLink').on('click', function(e){
		console.log('image link click');
		var imageLink = prompt('이미지 경로를 입력하세요');
		console.log(imageLink);
		artModify.setImageLink(imageLink);
		showInfo();
	});
	
	$('#upload').on('change','input',function(e){
		console.log($(this)[0]);
		const imageInput = $(this)[0];
		const formData = new FormData();
		formData.append("image", imageInput.files[0]);
		
		$.ajax({
			type:'POST',
			url: '/adminRest/setImageFile/'+seqno,
			processData: false,
			contentType: false,
			data: formData,
			//data: $(this)[0].files[0],
			dataType: 'json',
			success: function(result){
				console.log('result: ', result)
			},
			err: function(err){
				console.log("err:", err)
			}
		});
	});
	
	$('.form-group').on('click','.badge-primary',function(e){
		console.log('modify badge click');
		//console.log($(this).data('field'));
		var field = $(this).data('field');
		console.log(document.getElementById(field).value);
		var inputValue = document.getElementById(field).value;
		if(field=='artName') {field='name';}
		if(confirm('수정하시겠습니까?')){
			$.ajax({
	 			type:'post',
	 			url:'/adminRest/artModify/'+seqno,
	 			data: JSON.stringify({field:field,value:inputValue}),
	 			contentType: 'application/json; charset=utf-8',
	 			dataType:'text',
	 			success: function(result){
					alert(result);
					showInfo();
				},
	 			error : function(error){
	 				console.log("error:", error);
	 			}
	 		
	 		});
		}
	});
	
	$('#artTag').on('propertychange change keyup paste input','#tags_1_tag',function(e){
		//console.log($('#artTag').find('.dropdown-menu'));
		$('#artTag').find('.dropdown-menu *').remove();
		if(e.target.value==''){
			$('#artTag').find('.dropdown-menu').css('display','none');
			//console.log('빈값 인식 안함?');
		}else{
			$.ajax({
	 			type:'get',
	 			url:'/adminRest/tagSearch/'+seqno+'/'+e.target.value,
	 			contentType : 'application/json; charset=utf-8',
	 			success : function(result){
	 				for(var i=0; i<result.length; i++){
		 				$('#artTag').find('.dropdown-menu').append(
							$('<li>').text(result[i].name).attr('data-tagSeq',result[i].seqno).addClass('dropdown-item')
						).css('display','block');	
	 				}
	 			},
	 			error : function(error){
	 				console.log("error:", error);
	 			}
	 		});
		}
	});
	
	$('#artTag').on('click', '.dropdown-item', function(e){
		//console.log(e.target.getAttribute('key'));
		var tagSeq = e.target.getAttribute('data-tagSeq');
		//console.log(tagSeq);
		if(confirm('수정하시겠습니까?')){
			$.ajax({
	 			type:'get',
	 			url:'/adminRest/artTagInsert/'+seqno+'/'+tagSeq,
	 			contentType : 'application/json; charset=utf-8',
	 			dataType: 'text',
	 			success : function(result){
	 				alert(result);
	 				showInfo();
	 			},
	 			error : function(error){
	 				console.log("error:", error);
	 			}
	 		});
		}
 	});
	
	$('#artTag').on('click', 'a', function(e){
		//console.log('태그 삭제 아이콘 클릭 확인');
		var tagSeq = e.target.getAttribute('data-tagSeq');
		if(confirm('수정하시겠습니까?')){
			$.ajax({
	 			type:'get',
	 			url:'/adminRest/artTagDelete/'+seqno+'/'+tagSeq,
	 			contentType : 'application/json; charset=utf-8',
	 			dataType: 'text',
	 			success : function(result){
	 				alert(result);
	 				showInfo();
	 			},
	 			error : function(error){
	 				console.log("error:", error);
	 			}
	 		});
		}
	});
	
	function showInfo(){
			console.log('showInfo called... seqno:'+seqno);
			//console.log('showInfo seqno:'+seqno);
		artModify.getInfo(function(info){
			console.log(info);
			var str='<img id="image" class="form-control" src="'+info.imageRoute+'">';
			$('#imageDiv').html(str);
			artName.value=info.name;
			author.value=info.author;
			detail.innerHTML=info.detail;
			/* str='';
			var platformList = ['네이버웹툰','카카오웹툰','레진코믹스'];
			//console.log('platformList:'+platformList);
			//console.log('platformList.lenth:'+platformList.length);
			//console.log(info.platform);
			for(var i=0; i<platformList.length;i++){
				var isSelected='';
				//console.log(platformList[i]);
				if(info.platform==platformList[i]){
					isSelected='selected';
				}
				str+='<option '+isSelected+'>'+platformList[i]+'</option>';
			}
			platform.innerHTML=str; */
			
			str='';
			for(var i=0; i<info.tag.length;i++){
				str+='<span class="tag"><span>'+info.tag[i].name+'&nbsp;&nbsp;</span><a href="#" data-tagSeq='+info.tag[i].seqno+' title="Removing tag">x</a></span>';
			}
			str+='<div id="tags_1_addTag"><input id="tags_1_tag" value="" placeholder="add a tag" style="color: rgb(102, 102, 102); width: 72px;"><ul class="dropdown-menu"></ul></div>';
			str+='<div class="tags_clear"></div>';
			
			artTag.innerHTML=str;
			
		});
	}
});
</script>
</html>