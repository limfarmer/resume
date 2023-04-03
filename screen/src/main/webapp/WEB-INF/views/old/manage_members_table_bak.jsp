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
						<div class="btn btn-outline-secondary" onclick="javascript:location.href='/admin/member?kind=all'"> 전체회원목록</div>
						<div class="btn btn-outline-secondary" onclick="javascript:location.href='/admin/member?kind=new'"> 신규회원목록</div>
						<div class="btn btn-outline-secondary" onclick="javascript:location.href='/admin/member?kind=del'"> 탈퇴회원목록</div>
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
													<select name="length" class="form-control input-sm" onchange="javascript:document.forms['memberFilter'].submit();">
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
											<c:if test="${criteria.kind eq 'del'}">
											<div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap no-footer" style="display: inline">
												<div class="dt--members-del btn-group">
													<a class="btn btn-default buttons-html5 btn-sm" href="/adminRest/memberDelete">
														<span>탈퇴처리한 회원 목록에서 삭제하기</span>
													</a>
												</div>
											</div>
											</c:if>
											<div id="datatable-members_filter" class="dataTables_filter" onchange="javascript:document.forms['memberFilter'].submit();">
												<select name="searchField">
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
													<input name="keyword" type="search" class="form-control input-sm" onchange="javascript:document.forms['memberFilter'].submit();"
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
											<c:set value="${members.currentPage*criteria.length-criteria.length+1}" var="startNum"/>
											<c:if test="${members.currentPage*criteria.length>members.total}">
												<c:set value="${members.total}" var="endNum" />
											</c:if>
											<c:if test="${members.currentPage*criteria.length<members.total}">
												<c:set value="${members.currentPage*criteria.length}" var="endNum" />
											</c:if>
											<tbody>
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
											</tbody>
										</table>
										
										<div class="dataTables_info" id="datatable-members_info" role="status" aria-live="polite">
											Showing <c:out value="${startNum}" /> to ${endNum } of ${members.total} entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-members_paginate">
											<ul class="pagination">
												<c:if test="${members.currentPage>members.pagingCount}">
												<li class="paginate_button previous disabled" id="datatable-members_previous">
													<a href="/admin/member?kind=${criteria.kind}&length=${criteria.length}&currentPage=${members.startPage-1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
														Previous
													</a>
												</li>
												</c:if>
												<c:forEach var="num" begin="${members.startPage}" end="${members.endPage}">
												<li class="paginate_members">
													<a <c:if test="${num eq members.currentPage}"> class="fw-bolder text-decoration-underline " </c:if>
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
												</c:if>
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