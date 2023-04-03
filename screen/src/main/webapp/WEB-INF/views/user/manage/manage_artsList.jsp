<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div>
				<h3>
					작품목록<!-- 페이지 타이틀 --> <small>현재 등록되어 있는 작품들<!-- 페이지 부제목 --></small>
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
							전체작품목록 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i><!-- 이거 누르면 접히게 만들...고 싶어요 -->
								</a>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="col-sm-12">
								<div class="card-box table-responsive">
									<p class="text-muted font-13 m-b-30">
										<!-- 테이블 설명 -->
										등록 완료된 작품 목록입니다. 
									</p>
									<div id="datatable-arts_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<c:set value="${artworkList}" var="artworkList"/>
										<form name="artFilter" method="post" action="/admin/artwork">
										<div class="dataTables_length" id="datatable-arts_length">
											<label>한번에 
												<select id="length" name="length" class="form-control input-sm">
													<c:forEach items="${criteria.lengthOpt}" var="len">
														<option value="${len}" 
															<c:if test="${len eq criteria.length}">
																selected
															</c:if>	
														>
														${len}</option>
													</c:forEach>
												</select> 개씩 보기
											</label>
										</div>
										<!-- <div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap no-footer" style="display:inline">
											<div class="dt-artworkList btn-group">
												<a class="btn btn-default buttons-html5 btn-sm" onclick="javascript:openWin.document.getElementById('name').value = 'test';">
													<span>테스트</span>
												</a>
											</div>
										</div> -->
										<div id="datatable-arts_filter" class="dataTables_filter">
											<select id="searchField" name="searchField">
													<option value="name"
														<c:if test="${criteria.searchField eq 'name'}">selected</c:if>
														>작품명</option>
													<option value="author"
														<c:if test="${criteria.searchField eq 'author'}">selected</c:if>
														>작가명</option>
												</select>
												<label>
												검색:
													<input id="keyword" name="keyword" type="search" class="form-control input-sm"
														<c:if test="${criteria.keyword ne null}"> value="${criteria.keyword}"</c:if>
													>
												</label>
										</div>
										</form>
										<table id="datatable-arts" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art name: activate to sort column descending">
														작품명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Author name: activate to sort column descending">
														작가명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art detail: activate to sort column descending" style="max-width:500px;">
														작품설명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="isEnd: activate to sort column descending">
														완결여부
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art Url: activate to sort column descending" style="display: none;">
														URL
													</th>
													<th>수정</th>
												</tr>
											</thead>
											<c:set value="${artworkList.currentPage*criteria.length-criteria.length+1}" var="startNum"/>
											<c:if test="${artworkList.currentPage*criteria.length>artworkList.total}">
												<c:set value="${artworkList.total}" var="endNum" />
											</c:if>
											<c:if test="${artworkList.currentPage*criteria.length<artworkList.total}">
												<c:set value="${artworkList.currentPage*criteria.length}" var="endNum" />
											</c:if>
											<tbody class="dataTableBody">
												<%-- <c:if test="${artworkList.content.size() ne 0}">
												<c:forEach items="${artworkList.content}" var ="artList" varStatus="status" begin="${startNum-1}" end="${endNum-1}">
													<tr>
														<td><c:out value="${artList.name}" /></td>
														<td><c:out value="${artList.author}" /></td>
														<td style="max-width:500px;"><c:out value="${artList.detail}" /></td>
														<td><c:out value="${artList.week}" /></td>
														<td style="display: none;"><c:out value="${artList.url}" /></td>
													</tr>
												</c:forEach>
												</c:if> --%>
											</tbody>
										</table>
										<div class="dataTables_info" id="datatable-arts_info" role="status" aria-live="polite">
											<%-- Showing <c:out value="${startNum}" /> to ${endNum } of ${artworkList.total} entries --%>
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-arts_paginate">
											<ul class="pagination">
												<%-- <c:if test="${artworkList.currentPage>artworkList.pagingCount}">
												<li class="paginate_button previous disabled" id="datatable-arts_previous">
													<a href="/admin/artwork?length=${criteria.length}&currentPage=${artworkList.startPage-1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}" >
														Previous
													</a>
												</li>
												</c:if>
												<c:forEach var="num" begin="${artworkList.startPage}" end="${artworkList.endPage}">
												<li class="paginate_arts active">
													<a <c:if test="${num eq artworkList.currentPage}"> class="fw-bolder text-decoration-underline " </c:if>
													href="/admin/artwork?length=${criteria.length}&currentPage=${num}&searchField=${criteria.searchField}&keyword=${criteria.keyword}" >
														${num}
													</a>
												</li>
												</c:forEach>
												<c:if test="${artworkList.totalPages>artworkList.endPage}">
												<li class="paginate_arts active">
													<a href="/admin/artwork?length=${criteria.length}&currentPage=${artworkList.endPage+1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
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
var openWin;
var artService = (function(){
	
	function getList(cri, callback, error){
 		console.log('getList called..');
 		$.getJSON({
 			type: 'post',
 			url : '/adminRest/artList',
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
		length: length.value||10,
		currentPage: $('.pagination .fw-bolder').attr('href') ||1,
		searchField: searchField.value, 
		keyword: keyword.value
	};
	
	console.log(criteria);
	
	showList(criteria);
	
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
		artService.getList(criteria,function(page){
			/* 해당사항 없는 경우 */
			console.log('getList return');
			console.log(page);
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
				str +='<tr><td>'+list[i].name+'</td><td>'+list[i].author+'</td><td style="max-width:500px;">'+list[i].detail+'</td><td>'+list[i].week+'</td>';
				str +='<td style="display: none;">'+list[i].url+'</td><td><button class="btn btn-primary" data-ano='+list[i].seqno+'>수정</button></td></tr>';
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
			str +='<li class="paginate_artworks"> <a '+active+' href="'+i+'"> '+i+'</a></li>';
		}
		if(next){
			str+='<li>';
			str+='<a href="'+(page.endPage+1)+'">Next</a></li>';
		}
		
		//console.log(str);
		$('.pagination').html(str);
		
	}
	

	$('.dataTableBody').on('click','button', function(e){
		console.log('modify click------------');
		//e.preventDefault();
		openChild($(this).data('ano'));
		//console.log($(this).data('ano'));
		//window.open("/admin/artModify", "작품수정하기", "width=570, height=350, resizable = no, scrollbars = no");
		//window.open('/admin/artModify', '작품수정하기','width=#, height=#');
	});

	function openChild(seqno) {
		//console.log(seqno);
		// window.name = "부모창 이름"; 
		window.name = 'parentForm';
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open('/admin/artModify/'+seqno, '작품수정하기', 'width=1000, height=550, resizable = no, scrollbars = no');
		//openWin.document.getElementById("name").value = seqno;
		openWin.onbeforeunload=function (){
			console.log('작동됨/?');
			//showList(criteria);
			//window.location.reload();
		}
	}

	
});

</script>

