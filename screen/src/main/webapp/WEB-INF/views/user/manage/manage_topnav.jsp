<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="top_nav">
	<div class="nav_menu">
		<div class="nav toggle">
			<a id="menu_toggle">
				<i class="fa fa-bars" onclick="bodyClassChange()" ></i>
			</a>
		</div>
		<nav class="nav navbar-nav">
			<ul class="navbar-right">
			<!-- 오른쪽 상단 프로필인데... 다 써놓고 나니 필요한지에 대해 의문이 생김... -->
				<li class="nav-item dropdown open" style="padding-left:15px;">
					<a href="javascript:;" class="user-profile dropdown-toggle"
					aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
					aria-expand="false"> 
						<img src="/manage/assets/images/profile_sample.png" alt="">
						<%=(String)session.getAttribute("sess_name") %> 
					</a>
					<!-- 프로필 눌렀을때 나오는 드롭다운 메뉴인데용... -->
					<div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown" x-placement="bottem-start" style="will-change: transform; top: 0px; left: 0px; transform: translate3d(-88px, 21px, 0px);">
						<a class="dropdown-item" href="javascript:;">Profile</a>
						<a class="dropdown-item" href="javascript:;">Settings</a>
						<a class="dropdown-item" href="javascript:;">Help</a>
						<a class="dropdown-item" href="javascript:;">
							<i class="fa fa-sign-out pull-right"></i>
							Logout
						</a>
					</div>
				</li>
				<!-- 메시지, 알림 오는 것 처럼 보이는 부분 -->
				<!-- <li role="presentation" class="nav-item dropdown open">
					<a href="javascript:;" class="dropdown-toggle info-number"
					id="navbarDropdown1" data-toggle="dropdown" aria-expand="false">
						<i class="fa fa-envelope-o"></i>
						<span class="badge bg-green">6</span>
					</a>
				</li> -->
			</ul>
		</nav>
	</div>
</div>
<script>
	function bodyClassChange(){
		const bodyClass = document.getElementById('nav_body').className;
		if(bodyClass=='nav-md'){
			document.getElementById('nav_body').className='nav-sm'
		}else{
			document.getElementById('nav_body').className='nav-md'
		}
	}
</script>
