<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<title>관리자 페이지-작품등록요청목록</title>
		<%@ include file="manage_head.jsp" %>
	</head>
	<body class="nav-md" id="nav_body">
		<div class="container body">
			<div class="main_container">
				<%@ include file="manage_sidebar.jsp" %>
				<%@ include file="manage_topnav.jsp" %>


<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					작품등록요청
					<!-- 페이지 타이틀 -->
					<small>작품 등록 요청 목록<!-- 페이지 부제목 --></small>
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
							작품등록 요청 
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
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
										회원들이 요청한 작품등록 요청들입니당
									</p>
									<div id="datatable-responsive_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="row">
											<!-- <div class="col-sm-6">
												<div class="dataTables_length" id="datatable-responsive_length">
													<label>
														Show 
														<select name="datatable-responsive_length" aria-controls="datatable-responsive" class="form-control input-sm">
														<option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option></select> entries
													</label>
												</div>
											</div>
											<div class="col-sm-6">
												<div id="datatable-responsive_filter"
													class="dataTables_filter">
													<label>검색:
														<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-responsive">
													</label>
												</div>
											</div>
										</div> -->
										<div class="row">
											<div class="col-sm-12">
												<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art name: activate to sort column descending">
																작품명
															</th>
															<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Author name: activate to sort column descending">
																작가명
															</th>
															<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art detail: activate to sort column descending">
																작품설명
															</th>
															<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="isEnd: activate to sort column descending">
																완결여부
															</th>
															<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art Url: activate to sort column descending" style="display: none;">
																URL
															</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${artRequest}" var ="artRequest">
															<tr role="row" class="parent">
																<td tabindex="0" class="sorting_1"><c:out value="${artRequest.name}" /></td>
																<td><c:out value="${artRequest.author}" /></td>
																<td><c:out value="${artRequest.detail}" /></td>
																<td><c:out value="${artRequest.week}" /></td>
																<td style="display: none;"><c:out value="${artRequest.url}" /></td>
															</tr>
															<tr class="child">
																<td class="child" colspan="5">
																	<ul data-dtr-index="4">
																		<li data-dtr-index="5" data-dt-row="4" data-dt-column="5">
																			<span class="dtr-title"> URL 화면 확인</span>
																			<iframe src="<c:out value="${artRequest.url}" />" style="width:100%;"></iframe>
																		</li>
																	</ul></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										<!-- <div class="row">
											<div class="col-sm-5">
												<div class="dataTables_info" id="datatable-responsive_info" role="status" aria-live="polite">Showing 1 to 1 of 2 entries</div>
											</div>
											<div class="col-sm-7">
												<div class="dataTables_paginate paging_simple_numbers" id="datatable-responsive_paginate">
													<ul class="pagination">
														<li class="paginate_button previous disabled" id="datatable-responsive_previous">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="0" tabindex="0">Previous</a>
														</li>
														<li class="paginate_button active">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="1" tabindex="0">1</a>
														</li>
														<li class="paginate_button ">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="2" tabindex="0">2</a>
														</li>
														<li class="paginate_button ">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="3" tabindex="0">3</a>
														</li>
														<li class="paginate_button ">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="4" tabindex="0">4</a>
														</li>
														<li class="paginate_button ">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="5" tabindex="0">5</a>
														</li>
														<li class="paginate_button ">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="6" tabindex="0">6</a>
														</li>
														<li class="paginate_button next" id="datatable-responsive_next">
															<a href="#" aria-controls="datatable-responsive" data-dt-idx="7" tabindex="0">Next</a>
														</li>
													</ul>
												</div>
											</div>
										</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

			</div>
		</div>
	</body>
</html>