<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>관리자 페이지-테이블 샘플</title>
		<%@ include file="manage_head.jsp" %>
	</head>
	
	<body class="nav-md">
		<div class="container body">
			<div class="main_container">
				<%@ include file="manage_sidebar.jsp" %>
				<%@ include file="manage_topnav.jsp" %>



<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					회원목록 <small></small>
				</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							전체회원목록 
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i>
								</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" 
								data-toggle="dropdown" role="button" 
								aria-expanded="false">
									<i class="fa fa-wrench"></i>
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#">Settings 1</a>
									<a class="dropdown-item" href="#">Settings 2</a>
								</div>
							</li>
							<li>
								<a class="close-link">
									<i class="fa fa-close"></i>
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
										테이블에 대한 설명을 씁니당
									</p>
									<div id="datatable-buttons_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="dt-buttons btn-group">
											<a class="btn btn-default buttons-copy buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
												<span>Copy</span>
											</a>
											<a class="btn btn-default buttons-csv buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
												<span>CSV</span>
											</a><a class="btn btn-default buttons-excel buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
												<span>Excel</span>
											</a>
											<a class="btn btn-default buttons-pdf buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
												<span>PDF</span>
											</a>
											<a class="btn btn-default buttons-print btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
												<span>Print</span>
											</a>
										</div>
										<div class="dataTables_length" id="datatable-buttons_length">
											<label>한번에 
												<select name="datatable-buttons_length" aria-controls="datatable-buttons" class="form-control input-sm">
													<option value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select> 명씩 보기
											</label>
										</div>
										<div id="datatable-buttons_filter" class="dataTables_filter">
											<label>
											검색:
												<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons">
											</label>
										</div>
										<table id="datatable-buttons" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-sort="ascending" aria-label="Name: activate to sort column descending">
														ID
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-label="Position: activate to sort column ascending">
														이름
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-label="Office: activate to sort column ascending">
														메일주소
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-label="Age: activate to sort column ascending">
														등급
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-label="Start date: activate to sort column ascending">
														가입일자
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-buttons" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending">
														생년월일(Opt)
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>limfisherman</td>
													<td>임정후</td>
													<td>몰?루?</td>
													<td>관리자</td>
													<td>2022.08.04</td>
													<td>(입력안함)</td>
												</tr>
												<tr>
													<td>shiri_bot</td>
													<td>채정실</td>
													<td>cowjdtlf@gmail.com</td>
													<td>관리자</td>
													<td>2022.08.04</td>
													<td>1991.09.06.</td>
												</tr>
											</tbody>
										</table>
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