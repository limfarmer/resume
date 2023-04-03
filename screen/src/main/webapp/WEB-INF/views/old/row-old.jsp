<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="content">
	<!--전체를 감쌀 뼈대-->
	<div class="slides">
		<!--슬라이드 아이템을 감쌀 뼈대-->
		<div class="slide_item"></div>
		<!--슬라이드될 아이템들 -->
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		<div class="slide_item"></div>
		<div class="slide_item"></div>
	</div>
	<!-- 살려야한다  -->
	<div style="display:flex;width:100%;justify-content: space-between;">
		<span class="prevButton">◀</span>
		<span class="nextButton">▶</span>
	</div>
	<!--이전 버튼 -->
	<div class="Thumbnail">
		<!--썸네일을 감쌀 뼈대 -->
		<div class="thumbnail_item"></div>
		<!--썸네일 아이템들 -->
		<div class="thumbnail_item"></div>
		<div class="thumbnail_item"></div>
		<div class="thumbnail_item"></div>
		<div class="thumbnail_item"></div>
		<div class="thumbnail_item"></div>
	</div>
	<!--다음 버튼 -->
</div>
<!-- <img src="images/logo.png"> -->

 <script src="js/slideShow.js"></script>
 
<div>
	<h2>이 주의 추천웹툰!</h2>
	<!-- <a href="#" style="float: right">더보기</a> -->
</div>
<div class="row">
	<div class="card">
		<div class="clickBox" onclick="location.href='artDetail.jsp'">
			<div class="imgframe" style="height: 200px;overflow:hidden;">
				<img class="mainImage" src="images/no_home.jpg">
			</div>
			<h3>집이 없어</h3>
		</div>
		<div class="clickBox" onclick="location.href='search.jsp'">
			<h5>와난</h5>
		</div>
		<a class="tag" href="search.jsp">오컬트</a><a class="tag" href="search.jsp">학원물</a><a class="tag" href="search.jsp">성장드라마</a><a class="tag" href="search.jsp">드라마</a><a class="tag" href="search.jsp">스토리</a><a class="tag" href="search.jsp">공감</a>
	</div>
	<div class="card">
		<div class="clickBox" onclick="location.href='artDetail.jsp'">
			<div class="imgframe" style="height: 200px;overflow:hidden;">
				<img class="mainImage" src="images/sample1.jpg">
			</div>
			<h3>독립일기</h3>
		</div>
		<div class="clickBox" onclick="location.href='search.jsp'">
			<h5>자까</h5>
		</div>
		<a class="tag" href="search.jsp">일상</a><a class="tag" href="search.jsp">에피소드</a><a class="tag" href="search.jsp">공감</a>
	</div>
	<div class="card">
		<div class="clickBox" onclick="location.href='artDetail.jsp'">
			<div class="imgframe" style="height: 200px;overflow:hidden;">
				<img class="mainImage" src="images/sample2.jpg">
			</div>
			<h3>이상한 변호사 우영우</h3>
		</div>
		<div class="clickBox" onclick="location.href='search.jsp'">
			<h5>유일</h5><h5>화음조</h5><h5>이예지</h5>
		</div>
		<a class="tag" href="search.jsp">법정드라마</a><a class="tag" href="search.jsp">드라마원작</a><a class="tag" href="search.jsp">힐링</a><a class="tag" href="search.jsp">직업드라마</a><a class="tag" href="search.jsp">성장드라마</a><a class="tag" href="search.jsp">드라마</a><a class="tag" href="search.jsp">스토리</a><a class="tag" href="search.jsp">공감</a>
	</div>
	<div class="card">
		<div class="clickBox" onclick="location.href='artDetail.jsp'">
			<div class="imgframe" style="height: 200px;overflow:hidden;">
				<img class="mainImage" src="images/sample3.jpg">
			</div>
			<h3>나노마신</h3>
		</div>
		<div class="clickBox" onclick="location.href='search.jsp'">
			<h5>현절무</h5><h5>금강불괴</h5><h5>한중월야</h5>
		</div>
		<a class="tag" href="search.jsp">사이다</a><a class="tag" href="search.jsp">게임판타지</a><a class="tag" href="search.jsp">이능력배틀물</a><a class="tag" href="search.jsp">사극</a><a class="tag" href="search.jsp">소설원작</a><a class="tag" href="search.jsp">무협</a><a class="tag" href="search.jsp">스토리</a>
	</div>

</div>

<div>
	<h2>지금 인기있는 태그</h2>
</div>
<div>
	<h3 class="tag clickBox" onclick="location.href='search.jsp'">스토리</h3>
	<!-- <a href="#" style="float: right">더보기</a> -->
</div>
<div class="row">
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/no_home.jpg">
		</div>
		<p>집이 없어</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample2.jpg">
		</div>
		<p>이상한 변호사 우영우</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample3.jpg">
		</div>
		<p>나노마신</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample4.jpg">
		</div>
		<p>연애혁명</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample5.jpg">
		</div>
		<p>호랑신랑뎐</p>
	</div>
</div>
<div>
	<h3 class="tag clickBox" onclick="location.href='search.jsp'">드라마</h3>
	<!-- <a href="#" style="float: right">더보기</a> -->
</div>
<div class="row">
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/no_home.jpg">
		</div>
		<p>집이 없어</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample1.jpg">
		</div>
		<p>독립일기</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample2.jpg">
		</div>
		<p>이상한 변호사 우영우</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample4.jpg">
		</div>
		<p>연애혁명</p>
	</div>
	<div class="minicard clickBox" onclick="location.href='artDetail.jsp'">
		<div class="overflow-hidden" style="height: 150px;">
			<img class="mainImage" src="images/sample6.jpg">
		</div>
		<p>개를 낳았다</p>
	</div>
</div>

