<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					태그목록<!-- 페이지 타이틀 --> <small><!-- 페이지 부제목 --></small>
				</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- 여기까지 제목 -->
		
		<!-- 컨텐츠 큰 영역 -->
		<div class="row">
			<!-- 하얀 박스 하나 -->
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							전체태그목록 <!-- 테이블 제목 -->
							<small></small>
						</h2>
					<!-- 	<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
								</a>
							</li>
						</ul> -->
						<div class="clearfix"></div>
					</div>
					<div class="x_content tag_list">
					
					<%-- <c:forEach items="${tagList}" var="tagLists">
						<c:if test="${mid ne tagLists.mid}">
							<div class="row">
								<c:if test="${top ne tagLists.top}">
									<div class="tag_top col">
										${tagLists.top}
									</div>
								</c:if>
								<c:if test="${top eq tagLists.top}">
									<div class="tag_top col" style="visibility:hidden"></div>
								</c:if>
								<c:set value="${tagLists.top}" var="top"/>
								<c:if test="${top ne tagLists.mid}">
									<div class="tag_mid col">
										${tagLists.mid}
									</div>
								</c:if>
								<c:set value="${tagLists.mid}" var="mid"/>
								<div class="drag-container col-8">
									<c:forEach items="${tagList}" var="tagName">
										<c:if test="${top eq tagName.top && mid eq tagName.mid}">
											<div class="tag" draggable="true">
												${tagName.name}
												<a class="modifys" href="javascript:modal('${tagName.seqno}','${tagName.name}');" style="display:none;">
													<i class="fa fa-pen-to-square"></i>
												</a>
												<a class="deletes" href="javascript:modal('${tagName.seqno}','${tagName.name}');" style="display:none;">
													<i class="fa fa-circle-xmark"></i>
												</a>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach> --%>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							태그 추가 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<!-- <ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>이거 누르면 접히게 만들...고 싶어요
								</a>
							</li>
						</ul> -->
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="col tag_modify">
								<div>
								<span>태그 추가</span>
								<br>
									<input type="text" id="insertTagName">
									<button class="btn btn-primary" id="insertTagBtn">추가</button>
									<p id="duplicate"></p>
								</div>
								<span>태그 대분류 추가</span>
								<form method="post" class="tag_modifyForm">
									<input type="text" disabled>
									<input class="btn btn-secondary" type="submit" value="추가">
								</form>
								<span>태그 중분류 추가</span>
								<form method="post" class="tag_modifyForm">
									<select>
										<c:forEach items="${tagList}" var="tagList">
										<c:if test="${tagList.top ne top}">
										<option value="${tagList.topSeq}">${tagList.top}</option>
										</c:if>
										<c:set value="${tagList.top}" var="top"/>
										</c:forEach>
									</select>
									<input type="text" disabled>
									<input class="btn btn-secondary" type="submit" value="추가">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							태그 편집 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<!-- <ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>이거 누르면 접히게 만들...고 싶어요
								</a>
							</li>
						</ul> -->
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="cols tag_modify">
								<!-- <span>태그 이름 변경</span> -->
								<a id="modifyBtn" class="btn btn-primary" href="javascript:modeChange('modify')">태그 이름 변경</a>
								<br>
								<a id="deleteBtn" class="btn btn-primary" href="javascript:modeChange('delete')">태그 삭제</a>
								<br>
								<a id="categoryBtn" class="btn btn-secondary" href="#" style="cursor:default;">분류 수정</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="modal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 id="modalTitle" class="modal-title"></h5>
				<button type="button" class="btn-close modalCloseBtn" ></button>
			</div>
			<div class="modal-body">
				<p id="modalText"></p>
					<input type="hidden" id="modal_seqno" name="seqno">
					<input type="text" id="modal_tagName" name="tagName">
					<p id="modal_duplicate"></p>
					<div class="modal-footer">
						<button class="btn btn-primary" id="modal_submit" name="submit">확인</button>
						<button class="btn btn-secondary modalCloseBtn" >취소</button>
					</div>
			</div>
		</div>
	</div>
</div>
<script>
					console.log("tag Module start");
					 
					 var tagService = (function(){
						 
						 function add(name, callback,error){
						 		console.log('tag add...');
						 		
						 		$.ajax({
						 			type:'post',
						 			url:'/adminRest/tagInsert/'+name,
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
						 
						 function getList(callback, error){
						 		
						 		$.getJSON('/adminRest/tagList.json', function(data){
						 			if(callback){
						 				callback(data);
						 			}
						 		}).fail(function(xhr,status,err){
						 			if(error){
						 				error();
						 			}
						 		});
						 		
						 	}
						 function update(tag, callback, error){
						 		console.log('태그 수정' + tag.seqno);
						 		var tno = tag.seqno;
						 		var name = tag.name;
						 		$.ajax({
						 			type: 'put',
						 			url : '/adminRest/tagModify',
						 			data: JSON.stringify(tag),
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
						 function remove(tno, callback, error){
						 		$.ajax({
						 			type: 'delete',
						 			url: '/adminRest/tagDelete/'+tno,
						 			success: function(result, status, xhr){
						 				callback(result);
						 			},
						 			error : function(){
						 				if(error){
						 					error(er);
						 				}
						 			}
						 		
						 		});
						 	}
						 
						 function confirm(name, callback,error){
						 		console.log('name duplicate confirm...');
						 		
						 		$.ajax({
						 			type:'get',
						 			url:'/adminRest/tagConfirm/'+name,
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
					 		add:add,
					 		getList:getList,
					 		update:update,
					 		remove:remove,
					 		confirm:confirm
					 	};
					 	
					 	
					 })();
					 
					 		$(document).ready(function(){
								//console.log(tagService);	
								console.log('=============');	
								console.log('tag get list');
								var modal = $('#modal');
								
								modal.hide();
								showList();
								
								function showList(){
									tagService.getList(function(list){
										var str="";
										var top="";
										var mid="";
										var rowNum=1;
										//console.log(list.length);
										str+='<div class="row"><table>';
										str+='<colgroup><col class="top_tag"><col class="mid_tag"><col class="tag_name"></colgroup>';
										str+='<thead><th>대분류</th><th>중분류</th><th>개별태그</th></thead><tbody>'
										for(var i=0, len=list.length || 0; i<len ; i++){
											//console.log(list[i]);
											
											if(mid != list[i].mid){
												rowNum+=1;
												str+='<tr><td>'+(list[i].top==null? '미분류':list[i].top)+'</td>';
												top=list[i].top;
												str+='<td>'+(list[i].mid==null? '미분류':list[i].mid)+'</td>';
												mid=list[i].mid
												str+='<td class="drag-container">';
												
												for(var j=0, len=list.length || 0; j<len ; j++){
													if(top == list[j].top && mid == list[j].mid){
														str+='<span class="tag"><span draggable="true" data-tno="'+list[j].seqno+'" data-name="'+list[j].name+'">'+list[j].name ;
														str+='<a class="modifys" data-tno="'+list[j].seqno+'" data-name="'+list[j].name+'" style="display:none;"> <i class="fa fa-pen-to-square"></i></a>';
														str+='<a class="deletes" data-tno="'+list[j].seqno+'" data-name="'+list[j].name+'" style="display:none;"> <i class="fa fa-circle-xmark"></i></a>';
														str+='</span></span>';
													}
												}
												str+='</td></tr>';
											}
										}
										str+='</tbody></table></div>';
										$('.tag_list').html(str);
										//mergeTable('.tag_list',0);
										$('.tag_list').rowspan(0);
										for(var i=0; i<rowNum; i++){
											$('.tag_list').colspan(i);
										}
									});
								}//여기까지 showList
								
								$.fn.rowspan = function(colIdx, isStats) {
									return this.each(function(){
										var that;
										$('tr', this).each(function(row) {
											$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
												if ($(this).html() == $(that).html() && 
														(!isStats || isStats && $(this).prev().html() == $(that).prev().html())) {
													rowspan = $(that).attr("rowspan") || 1;
													rowspan = Number(rowspan)+1;
													
													$(that).attr("rowspan",rowspan);
													
													// do your action for the colspan cell here
													$(this).hide();
													
													// do your action for the old cell here
													//$(this).remove(); 
													
												} else {
													that = this;
												}
												// set the that if not already set
												that = (that == null) ? this : that;
											});
										});
									});
								}; 
								
								$.fn.colspan = function(rowIdx) {
								    return this.each(function(){
								        
								        var that;
								        $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
								            $(this).find('td').filter(':visible').each(function(col) {
								                if ($(this).html() == $(that).html()) {
								                    colspan = $(that).attr("colspan") || 1;
								                    colspan = Number(colspan)+1;
								                    
								                    $(that).attr("colspan",colspan);
								                    $(this).hide(); // .remove();
								                } else {
								                    that = this;
								                }
								                
								                // set the that if not already set
								                that = (that == null) ? this : that;
								                
								            });
								        });
								    });
								}
								
								function mergeTable(target, index) {
									var loop = null;
									var start_idx = 0;  //최초 td테그의 인덱스를 담을 변수 입니다.
									var add_num = 1;    //마지막 td 테그의 인덱스를 담을 변수 입니다.
									$(target).find('tr').each(function (idx) {
										var target_text = $(this).find('td').eq(index).text();
										if (!loop) {  //최초 동작이면
											loop = target_text;
											start_idx = idx;
										} else if (target_text == loop) {  //같은 열이 발견된 것 이라면
											add_num++;
											//같은열이긴 한데 근데 마지막이면
											if (idx == $(target).find('tr').length - 1) {
												$(target).find('tr').eq(start_idx).find('td').eq(index).attr("rowSpan", add_num).css('vertical-align', 'middle');
												for (var i = start_idx + 1; i < start_idx + add_num; i++) {
													$(target).find('tr').eq(i).find('td').eq(index).hide(); //hide로 변경
												}
											}
										} else { //다른 텍스트가 발견된 것 이라면
											if (add_num != 1) {//머지가 필요한 경우라면
												$(target).find('tr').eq(start_idx).find('td').eq(index).attr("rowSpan", add_num).css('vertical-align', 'middle');
												for (var i = start_idx + 1; i < start_idx + add_num; i++) {
													$(target).find('tr').eq(i).find('td').eq(index).hide(); //hide로 변경
												}
											}
											start_idx = idx;
											loop = target_text;
											add_num = 1;
										}
									});
								}
								
								//태그 추가 시 중복체크
								$('#insertTagName').on('propertychange change keyup paste input',function(e){
									if(e.target.value==''){
										duplicate.innerHTML='';
									}else{
										tagService.confirm(e.target.value,function(rs){
											if(rs=='0'){
												duplicate.innerHTML='사용가능한 태그입니다.';
												insertTagBtn.style.display='inline-block';
											}else if(rs=='1'){
												duplicate='중복된 태그입니다.';
												insertTagBtn.style.display='none';
											}else{
												duplicate.innerHTML='뭔가 잘못되었다.';
											}
										
										});
									}
								});
								
								//태그 이름 변경 시 중복체크
								$('#modal_tagName').on('propertychange change keyup paste input',function(e){
									if(e.target.value==''){
										modal_duplicate.innerHTML='';
									}else{
										tagService.confirm(e.target.value,function(rs){
											if(rs=='0'){
												modal_duplicate.innerHTML='사용가능한 태그입니다.';
												modal_submit.style.display='inline-block';
											}else if(rs=='1'){
												modal_duplicate.innerHTML='중복된 태그입니다.';
												modal_submit.style.display='none';
											}else{
												modal_duplicate.innerHTML='뭔가 잘못되었다.';
											}
										
										});
									}
								});
								
								//추가 버튼
								$('#insertTagBtn').click(function(){
									var insert_name = document.getElementById('insertTagName').value;
									tagService.add(insert_name, function(result){
										alert('태그가 추가되었습니다.'+result)
										showList();
										insertTagName.value='';
										duplicate.innerHTML='';	
										//document.getElementById("newLine").innerHTML = '<li>' +reply.content+ '</li>' ;
									});
								});
								$('#modal_submit').on('click', function () {
						 			console.log('전송 버튼 클릭');
						 			var seqno =document.getElementsByName('seqno')[0].value;
						 			var name =document.getElementsByName('tagName')[0].value;
						 			if($(this)[0].innerHTML=='변경'){
						 				console.log('수정 함수 불러오기');
						 				var tag = {seqno: seqno,
													name: name};
						 				tagService.update(tag, function(result){
						 					alert(result);
						 					modal.hide();
						 					showList();
						 				});
						 				modifyBtn.innerHTML='태그 이름 변경';
						 			}else if($(this)[0].innerHTML=='삭제'){
						 				console.log('삭제 함수 불러오기');
						 				tagService.remove(seqno, function(result){
						 					alert(result);
						 					modal.hide();
						 					showList();
						 				});
						 				deleteBtn.innerHTML='태그 삭제';
						 			}
						 		});
								
								/* $('.tag_list').on('click','.modifys',function(e){
									console.log('수정버튼 클릭');
									modal_tagName.val($(this).data('name'));
									modal.data('tno',$(this).data('tno'));
									modal.show();
								}); */
								/* $(document).on('click', '.deletes', function () {
					 			console.log('삭제아이콘 클릭');
					 			modal($(this).data('tno'),$(this).data('name'));
					 			}); */
								
								$('.tag_list').on('click','.modifys' , function(e){
									console.log('수정아이콘 클릭 이벤트');
									console.log('tno:'+$(this).data('tno'))
									console.log('name:'+$(this).data('name'))
									modal_show($(this).data('tno'),$(this).data('name'));
								});
								
								$('.tag_list').on('click','.deletes' , function(e){
									console.log('삭제아이콘 클릭 이벤트');
									modal_show($(this).data('tno'),$(this).data('name'));
								});
								
								$('.modalCloseBtn').on('click', function(e){
									console.log('모달 닫기 버튼');
									modal.hide();
									modal_duplicate.innerHTML='';
								});
								
								function modal_show(seqno,tagName){
									modal.css('display', 'flex');
									modal.addClass('show');
									modal_seqno.value=seqno;
									document.getElementById('modal_tagName').value=tagName;
								}
								
								var modal_title = $('#modalTitle');
								var modal_text = $('#modalText');
								var modal_tagName = modal.find('input[name="tagName"]');
								
							}); //여기까지 onready
							
							/* function modal(seqno,name){
								//document.getElementById('modal').style.display='flex';
								//document.getElementById('modal').classList.add("show");
								//const modalForm = document.forms['modalForm'];
								//modalForm.elements['seqno'].value=seqno;
								//modalForm.elements['tagName'].value=name;
								//console.log(seqno);
								//console.log(name);
								document.getElementsByName('seqno')[0].value=seqno;
								document.getElementsByName('tagName')[0].value=name;
							} */

							//var modal_value = document.getElementsByName('tagName')[0];
							//var modal_submit = document.getElementsByName('submit')[0];
							function modeChange(mode){
								var title;
								var text;
								var btn;
								if(mode=='modify'){
									const modifys = document.querySelectorAll('.modifys');
									btn=document.getElementById('modifyBtn').innerHTML;
									if(btn=='태그 이름 변경'){
										modifys.forEach(modify => {
											modify.style.display='inline';
										});
										title='태그 이름 변경';
										text='변경할 이름을 작성해주세요.';
										btn='태그 이름 변경 취소';
										modal_submit.innerHTML='변경';
										//document.forms['modalForm'].elements['submit'].value='변경';
										//document.forms['modalForm'].action='/adminRest/tagModify
									}else{
										modifys.forEach(modify => {
											modify.style.display='none';
										});
										btn='태그 이름 변경';
									}
									document.getElementById('modifyBtn').innerHTML=btn;
								}else if(mode=='delete'){
									const deletes = document.querySelectorAll('.deletes');
									btn=document.getElementById('deleteBtn').innerHTML;
									if(btn=='태그 삭제'){
										deletes.forEach(delete1 => {
											delete1.style.display='inline';
										});
										title='태그 삭제';
										text='정말 삭제하시겠습니까?';
										btn='태그 삭제 취소';
										document.getElementById('modal_tagName').disabled=true;
										modal_submit.innerHTML='삭제';
										//document.forms['modalForm'].elements['submit'].value='삭제';
										//document.forms['modalForm'].action='/admin/tagDelete';
									}else{
										deletes.forEach(delete1 => {
											delete1.style.display='none';
										});
										modal_tagName.disabled=false;
										btn='태그 삭제';
									}
									document.getElementById('deleteBtn').innerHTML=btn;
								}
								document.querySelector('.modal-title').InnerHTML=title;
								document.getElementById('modalText').InnerHTML=text;
								/* 왜 안 바뀔까... */
								
							}	
					 	
					 	
					</script>
<script>

	
	
/* 	
	function modifyClose(){
		document.getElementById('modal').style.display='none';
	}
  */
</script>

<script type="text/javascript" src="/js/dragdrop.js"></script>