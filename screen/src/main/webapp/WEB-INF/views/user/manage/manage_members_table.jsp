<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					회원목록<!-- 페이지 타이틀 --> <small><!-- 페이지 부제목 --></small>
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
						<div class="btn btn-outline-secondary<c:if test="${criteria.kind eq 'all'}"> btn-selected</c:if>" data-kind="all" > 전체회원목록</div>
						<div class="btn btn-outline-secondary<c:if test="${criteria.kind eq 'new'}"> btn-selected</c:if>" data-kind="new" > 신규회원목록</div>
						<div class="btn btn-outline-secondary<c:if test="${criteria.kind eq 'del'}"> btn-selected</c:if>" data-kind="del" > 탈퇴회원목록</div>
						<div class="clearfix"></div>
					</div>
					<div class="x_content" id="x_content0">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-box table-responsive">
									<p class="text-muted font-13 m-b-30">
										<!-- 테이블 설명 -->
										테이블 설명
									</p>
									<div id="datatable-members_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<c:set value="${members}" var="members"/>
										<form name="memberFilter" method="post" action="/admin/member?kind=${criteria.kind}">
											<div class="dataTables_length" id="datatable-members_length">
												<label>한번에 
													<select id="length" name="length" class="form-control input-sm">
													<!-- <select name="datatable-members_length" aria-controls="datatable-members" class="form-control input-sm" onchange="javascript:tableControl(this)"> -->
													<c:forEach items="${criteria.lengthOpt}" var="len">
														<option value="${len}" 
															<c:if test="${len eq criteria.length}">
																selected
															</c:if>	
														>
														${len}</option>
													</c:forEach>
													</select> 명씩 보기
												</label>
											</div>
											<div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap no-footer" style="display: inline">
												<!-- <div class="dt--members-del btn-group">
													<a class="btn btn-default buttons-html5 btn-sm" href="/admin/memberDelete">
														<span>탈퇴처리한 회원 목록에서 삭제하기</span>
													</a>
												</div> -->
											</div>
											<div id="datatable-members_filter" class="dataTables_filter">
												<select id="searchField" name="searchField">
													<option value="id"
														<c:if test="${criteria.searchField eq 'id'}">selected</c:if>
														>ID</option>
													<option value="name"
														<c:if test="${criteria.searchField eq 'name'}">selected</c:if>
														>이름</option>
													<option value="email"
														<c:if test="${criteria.searchField eq 'email'}">selected</c:if>
														>메일주소</option>
													<option value="auth"
														<c:if test="${criteria.searchField eq 'auth'}">selected</c:if>
														>등급</option>
												</select>
												<label>
												검색:
													<input id="keyword" name="keyword" type="search" class="form-control input-sm"
														<c:if test="${criteria.keyword ne null}"> value="${criteria.keyword}"</c:if>
													>
												</label>
											</div>
										</form>
										<table id="datatable-members" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting" rowspan="1" colspan="1">
														ID
													</th>
													<th class="sorting" rowspan="1" colspan="1">
														이름
													</th>
													<th class="sorting" rowspan="1" colspan="1">
														메일주소
													</th>
													<th class="sorting" rowspan="1" colspan="1">
														등급
													</th>
													<th class="sorting" rowspan="1" colspan="1">
														가입일자
													</th>
													<th class="sorting" rowspan="1" colspan="1">
														생년월일(Opt)
													</th>
												</tr>
											</thead>
											<%-- <c:set value="${members.currentPage*criteria.length-criteria.length+1}" var="startNum"/>
											<c:if test="${members.currentPage*criteria.length>members.total}">
												<c:set value="${members.total}" var="endNum" />
											</c:if>
											<c:if test="${members.currentPage*criteria.length<members.total}">
												<c:set value="${members.currentPage*criteria.length}" var="endNum" />
											</c:if> --%>
											<tbody class="dataTableBody">
											</tbody>
											<%-- <tbody>
												<c:if test="${members.content.size() ne 0}">
												<c:forEach items="${members.content}" var="member" varStatus="status" begin="${startNum-1}" end="${endNum-1}">
													<tr>
														<td><c:out value="${member.id}" /></td>
														<td><c:out value="${member.name}" /></td>
														<td><c:out value="${member.email}" /></td>
														<td><c:out value="${member.auth}" /></td>
														<td><c:out value="${member.wdate}" /></td>
														<td><c:out value="${member.birth}" /></td>
													</tr>
												</c:forEach>
												</c:if>
											</tbody> --%>
										</table>
										
										<div class="dataTables_info" id="datatable-members_info" role="status" aria-live="polite">
											<%-- Showing <c:out value="${startNum}" /> to ${endNum } of ${members.total} entries --%>
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-members_paginate">
											<ul class="pagination">
												<%-- <c:if test="${members.currentPage>members.pagingCount}">
												<li class="paginate_button previous disabled" id="datatable-members_previous">
													<a href="/admin/member?kind=${criteria.kind}&length=${criteria.length}&currentPage=${members.startPage-1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
														Previous
													</a>
												</li>
												</c:if>
												<c:forEach var="num" begin="${members.startPage}" end="${members.endPage}">
												<li class="paginate_members">
													<a data-page="${num}" <c:if test="${num eq members.currentPage}"> class="fw-bolder text-decoration-underline " </c:if>
													href="/admin/member?kind=${criteria.kind}&length=${criteria.length}&currentPage=${num}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
														${num}
													</a>
												</li>
												</c:forEach>
												<c:if test="${members.totalPages>members.endPage}">
												<li class="paginate_members active">
													<a href="/admin/member?kind=${criteria.kind}&length=${criteria.length}&currentPage=${members.endPage+1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
														Next
													</a>
												</li>
												</c:if> --%>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 컨텐츠 박스 단위 끝 -->
		</div>
	</div>
</div>

<script>
var memberService = (function(){
	
	function getList(cri, callback, error){
 		
 		$.getJSON({
 			type: 'post',
 			url : '/adminRest/memberList/',
 			data: JSON.stringify(cri),
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
	
	return {
		getList:getList
	};
})();

$(document).ready(function(){

	var criteria = {
		kind: $('.btn-selected').data('kind'),
		length: length.value||10,
		currentPage: $('.pagination .fw-bolder').attr('href') ||1,
		searchField: searchField.value, 
		keyword: keyword.value
	};
	
	console.log(criteria);
	
	showList(criteria);
	
	$('.x_title').on('click','.btn', function(e){
		console.log('btn click------------');
		$('.btn-selected').removeClass('btn-selected');
		$(this).addClass('btn-selected');
		criteria.kind=$(this).data('kind');
		showList(criteria);
	});
	
	$('.pagination').on('click','li a', function(e){
		console.log('page click------------');
		e.preventDefault();
		criteria.currentPage=$(this).attr('href');
		console.log(criteria.currentPage);
		showList(criteria);
	});
	
	$('#searchField').on('change', function(e){
		console.log('searchField change...');
		criteria.searchField=$(this).val();
		console.log(criteria.searchField);
		showList(criteria);
	});
	$('#length').on('propertychange change keyup paste input', function(e){
		console.log('length change...');
		criteria.length=$(this).val();
		console.log(criteria.length);
		showList(criteria);
	});
	
	$('#keyword').on('propertychange change keyup paste input', function(e){
		console.log('keyword change...');
		criteria.keyword=$(this).val();
		console.log(criteria.keyword);
		showList(criteria);
	});
	
	function showList(criteria){
		console.log('showList call');
		memberService.getList(criteria,function(page){
			/* 해당사항 없는 경우 */
			console.log('getList call');
			console.log(page);
			
			if(criteria.kind=='del'){
				$('#datatable-buttons_wrapper').html('<div class="dt--members-del btn-group"><a class="btn btn-default buttons-html5 btn-sm" href="/admin/memberDelete"><span>탈퇴요청 한달 넘은 개인정보 삭제하기</span></a></div>');
			}else{
				$('#datatable-buttons_wrapper').html('');
			}
			
			var list = page.content;
			if(list==null||list.length==0){
				$('.dataTableBody').html('');
				return;
			}
			var startIndex = page.cri.currentPage*page.cri.length-page.cri.length;
			/* 결과가 있는 경우 */
			var str='';
			for(var i=startIndex, len=Math.min(page.cri.currentPage*page.cri.length,page.total) || 0; i<len ; i++){
				//console.log(list[i]);
				str +='<tr><td>'+list[i].id+'</td><td>'+list[i].name+'</td><td>'+list[i].email+'</td><td>'+list[i].auth+'</td>';
				str +='<td>'+list[i].wdate+'</td><td>'+list[i].birth+'</td></tr>';
			}
			
			$('.dataTableBody').html(str);
			
			showPage(page);
		});
	}
	
	function showPage(page){

		var criteria = page.cri;
		
		console.log(criteria.currentPage*criteria.length-criteria.length+1);
		var str='Showing '+(criteria.currentPage*criteria.length-criteria.length+1)+' to '+Math.min(criteria.currentPage*criteria.length,page.total)+' of '+page.total+' entries';
		//console.log(criteria);
		
		$('.dataTables_info').html(str);
		
		str='';
		var prev = page.startPage !=1;
		var next = page.endPage*criteria.length<page.total;

		
		if(prev){
			str+='<li>';
			str+='<a href="'+(page.startPage-1)+'">Previous</a></li>';
		}
		for(var i=page.startPage; i<=page.endPage;i++){
			var active= criteria.currentPage==i ? ' class="fw-bolder text-decoration-underline "' : '';
			str +='<li class="paginate_members"> <a '+active+' href="'+i+'"> '+i+'</a></li>';
		}
		if(next){
			str+='<li>';
			str+='<a href="'+(page.endPage+1)+'">Next</a></li>';
		}
		
		//console.log(str);
		$('.pagination').html(str);
		
	}
});
</script>