<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="divTable minimalistBlack">
			<!-- 제목줄 삭제 
			<div class="divTableHeading">
			</div> -->
			<div class="divTableBody">
				<div class="divTableRow">
					<div class="divTableHead">장르</div>
					<div class="divTableCell">
						<input type="checkbox" name="genre" value="일상" id="일상" onclick="javascript:tagClick(this)">
						<label for="일상">일상</label> 
						<input type="checkbox" name="genre" value="개그" id="개그">
						<label for="개그">개그</label>
						<input type="checkbox" name="genre" value="드라마" id="드라마">
						<label for="드라마">드라마</label>  
						<input type="checkbox" name="genre" value="액션" id="액션">
						<label for="액션">액션</label>  
						<input type="checkbox" name="genre" value="감성" id="감성">
						<label for="감성">감성</label>  
						<input type="checkbox" name="genre" value="순정" id="순정">
						<label for="순정">순정</label>  
						<input type="checkbox" name="genre" value="판타지" id="판타지">
						<label for="판타지">판타지</label>  
						<input type="checkbox" name="genre" value="스릴러" id="스릴러">
						<label for="스릴러">스릴러</label>  
						<input type="checkbox" name="genre" value="시대극" id="시대극">
						<label for="시대극">시대극</label>  
						<input type="checkbox" name="genre" value="스포츠" id="스포츠">
						<label for="스포츠">스포츠</label>
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableHead">플랫폼</div>
					<div class="divTableCell">
						<input type="checkbox" name="genre" value="naver" id="naver">
						<label for="naver">네이버</label> 
						<input type="checkbox" name="genre" value="kakaoWebtoon" id="kakaoWebtoon">
						<label for="kakaoWebtoon">카카오웹툰</label> 
						<input type="checkbox" name="genre" value="kakaoPage" id="kakaoPage">
						<label for="kakaoPage">카카오페이지</label> 
						<input type="checkbox" name="genre" value="lezhin" id="lezin">
						<label for="lezin">레진</label> 
						<input type="checkbox" name="genre" value="toomics" id="toomics">
						<label for="toomics">투믹스</label> 
						<input type="checkbox" name="genre" value="bomtoon" id="bomtoon">
						<label for="bomtoon">봄툰</label> 
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableHead">완결 여부</div>
					<div class="divTableCell">
						<input type="checkbox" name="isEnding" value="연재중" id="연재중">
						<label for="연재중">연재중</label> 
						<input type="checkbox" name="isEnding" value="완결" id="완결">
						<label for="완결">완결</label> 
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableHead">평점</div>
					<div class="divTableCell">
						<input type="checkbox" name="rating" value="rating5" id="rating5">
						<label for="rating5">5점</label> 
						<input type="checkbox" name="rating" value="rating4" id="rating4">
						<label for="rating4">4점</label> 
						<input type="checkbox" name="rating" value="rating3" id="rating3">
						<label for="rating3">3점</label> 
						<input type="checkbox" name="rating" value="rating2" id="rating2">
						<label for="rating2">2점</label> 
						<input type="checkbox" name="rating" value="rating1" id="rating1">
						<label for="rating1">1점</label> 
					</div>
				</div>
				<div class="divTableRow">
					<div class="divTableHead">태그</div>
					<div class="tableFootStyle" id="result">원하시는 #태그를 골라주세요</div>
				</div>
			</div>
		</div>
		<div class= "searchBoard">
			<div class= "searchPop">
				<a href="#">인기순</a>
				<a href="#">조회순</a>
				<a href="#">등록일자순</a>
			</div>
			<div class="searchCard">
				<div class="detail">
					<div class="leftblock">
						<div class="image"></div>
						<div class="webtoonName">내과의사 박원장</div>
					</div>
					<div class="middleblock">
						<div class ="authorDetail">
							<span>글:</span>
							장봉수
							<span>그림:</span>
							장봉수 
						</div>
						<div class ="platformDetail">
							<span>연재처:</span>
							네이버
						</div>
						
						
						<!-- 현재 몇화까지 연재중인지 쓰기 완결여부 -->
						
						
						<div class ="webtoonDetail">
							어릴 적 TV에 나오는 의사들의 멋진 모습을 보고 의사가 되기로 결심한 박원장. 
							인고의 세월을 보내고 전문의가 되어 본인 이름을 내건 의원의 원장이 되었으나 그를 기다리고 있는 것은 TV 속 의사들의 찬란한 인생이 아니었으니...
							판타지 의학 드라마는 이제 그만! 19년 차 현직 의사가 직접 그리는 대한민국 의사들의 진짜 이야기! 화제의 하이퍼리얼리즘 메디컬드라마 '내과 박원장'
						</div>
						<div class ="genruDetail">
							<span>장르:</span>
							드라마
						</div>
						<div class ="webtoonHashtag">
							<a href="#">
								#드라마 
							</a>
							<a href="#">
								#스토리 
							</a>
							<a href="#">
								#전체 연령가 
							</a>
						</div>
					</div>
					<div class="rightblock">
						<div class="star">
							<h4>별점</h4>
							<h2>5.0/5.0</h2>
							<div>★★★★★</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	