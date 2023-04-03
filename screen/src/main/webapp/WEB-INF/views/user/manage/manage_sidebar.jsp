<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기
 
 if(strReferer == null){
%>
 <script language="javascript">
  alert("URL을 직접 입력해서 접근하셨습니다.\n정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="/admin/login";
 </script>
<%
  return;
 }
%>
<div class="col-md-3 left_col menu_fixed">
	<div class="left_col scroll-view">
		<div class="navbar nav_title">
			<a class="site_title" href="/admin/">
				<i class="fa fa-paw"></i> 
				<span> MANAGEMENT </span>
			</a>
		</div>
		<div class="clearfix"> <!-- ::after --> </div>
		<div class="profile clearfix">
			<div class="profile_pic">
				<img class="img-circle profile_img" src="/manage/assets/images/profile_sample.png" alt="">
			</div>
			<div class="profile_info">
				<span> Welcome, </span>
				<h2><%=(String)session.getAttribute("sess_name") %></h2>
			</div>
		</div>
		<br>
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section active">
				<h3>
					관리메뉴
				</h3>
				<ul class="nav side-menu">
					<li>
						<a href="/admin/">
							<i class="fa fa-house"></i>
							HOME
							
						</a>

					</li>
					<li>
						<a href="/admin/member?kind=all">
							<i class="fa fa-users"></i>
							Members
						</a>
					</li>
					<li>
						<a href="/admin/artwork">
							<i class="fa fa-paintbrush"></i>
							Art List
						</a>
					<li>
						<a href="/admin/artworkRequest">
							<i class="fa fa-file-circle-exclamation"></i>
							Request
						</a>
					</li>
					<li>
						<a href="/admin/tag">
							<i class="fa fa-hashtag"></i>
							Tags
						</a>
					</li>
					<!-- <li>
						<a href="#">
							<i class="fa fa-circle-exclamation"></i>
							Notice
						</a>
					</li> -->
				</ul>
			</div>
		</div>
		<div class="sidebar-footer hidden-small">
			<a data-toggle="tooltip" data-placement="top" data-origin-title="Settings">
				<span class="glyphicon glyphicon-cog"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" data-origin-title="FullScreen">
				<span class="glyphicon glyphicon-fullscreen"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" data-origin-title="Lock">
				<span class="glyphicon glyphicon-eye-close"> </span>
			</a>
			<a data-toggle="tooltip" data-placement="top" href="#" data-origin-title="Logout">
				<span class="glyphicon glyphicon-off"> </span>
			</a>
		</div>
	</div>
</div>