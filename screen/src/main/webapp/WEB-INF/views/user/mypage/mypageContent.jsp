<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display:flex;"><!-- 전체를 감싸는 div -->
	<div style="width:30%"><!-- 사이드바 -->
		<a class="mypageSidebarBtn" href="/mypage/preference">
			취향분석
		</a>
		<a class="mypageSidebarBtn"  href="/mypage/checkArt">
			평가한 작품보기
		</a>
		<a class="mypageSidebarBtn"  href="friend">
			친구관리
		</a>
		<a class="mypageSidebarBtn"  href="#">
			회원정보수정
		</a>
		<a class="mypageSidebarBtn"  href="#">
			문의현황<!-- 요기에 작품등록요청도 함께 표기 -->
		</a>
	</div>
	<div style="width:70%"><!-- 내용 -->
		<div> <!-- 뭔가 위의 문구문구 -->
			<h1><%=(String)session.getAttribute("sess_name")%></h1>
			<h3>아직 작품을 평가하지 않으셨네요! 작품을 평가하고 취향을 알아보세요!</h3><!-- 취향분석 이후에는 취향에 대한 한마디로 변경 -->
		</div>
		<h4> 평가한 작품 수 : 00개 </h4>
		<!-- 여기서는 기본적으로 최근에 평가한 항목들 확인가능.
		일단 구도만 잡으라고 평가하기의 콘텐츠를 가져왔지만 아마 별도로 구현해야 할 것.
		평가한 작품목록에서 여러가지 조회기능 제공예정 -->
		<div class="ratingFrame">
			<div class="ratingImgFrame">
				<div class="ratingImg"></div>
			</div>
			<div class="ratingContent">
				<h3 class="ratingTitle">작품제목</h3>
				<h4 class="ratingArtist">작가명</h4>
				<form name="ratingform" class="ratingform" method="post"
					action="./save">
					<fieldset>
						<input type="radio" name="rating" value="5" id="rate1"> 
						<label for="rate1">⭐</label>
						<input type="radio" name="rating" value="4" id="rate2" checked>
						<label for="rate2">⭐</label>
						<input type="radio" name="rating" value="3" id="rate3">
						<label for="rate3">⭐</label>
						<input type="radio" name="rating" value="2" id="rate4">
						<label for="rate4">⭐</label>
						<input type="radio" name="rating" value="1" id="rate5">
						<label for="rate5">⭐</label>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>