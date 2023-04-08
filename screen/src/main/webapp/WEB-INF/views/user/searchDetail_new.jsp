<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 장르 드롭다운 -->
<!-- <div id="dropDownBox">
<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">장르</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
					        <a class="nav-link dropdown-toggle text-dark d-inline midTag" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        중간 태그 자리</a>
		           			<div class="nav-link dropdown-toggle text-dark d-none ta" ></div>
			        	<ul class="dropdown-menu dropdown-menu-white tagList"  aria-labelledby="navbarDarkDropdownMenuLink">
				    	      	  	<li><button class="dropdown-item" name="tagname" value="">하위 태그자리</button></li>
			    	    </ul>
	       			 </li>
	   		   </ul>
	    </div>
	</nav>
</div>
 -->
<!-- 잘가 jstl아 -->
<div class="container">
 <div class="row"> 
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">장르</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq eq '1'}">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none ta" ></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white tagList"  aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><span><button class="dropdown-item" name="tagname" value="${tagName.seqno}">${tagName.name}</button></span></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div> 

<!-- 소재 드롭다운 -->
<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">소재</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq eq '2'}">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>	
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none" style="display:none"></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white" aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><button class="dropdown-item"  name="tagname" value="${tagName.seqno}">${tagName.name}</button></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div>
				
<!-- 그외 드롭다운 -->
<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">그 외</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq ne '1' && taglist.topSeq ne '2' }">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none" style="display:none"></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white" aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><button class="dropdown-item"  name="tagname" value="${tagName.seqno}">${tagName.name}</button></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div>
<!-- #dropDownBox div의 끝 -->		
</div>	
<!-- 별점 -->	
<!-- <div class="row">
	<div class="col-2 d-flex justify-content-center	"></div>
	<div class="col-10 d-flex flex-row justify-content-left">
		<label for="customRange3" class="form-label">별점</label>
		<input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange3">
	</div>
</div>
 -->
<!-- 태그 -->
<div class="row">
	<div class="col-2 d-flex justify-content-center	"></div>
	<div class="col-10 d-flex flex-row justify-content-left" >
		<div class="tableFootStyle" id="result" >
		</div>
	</div>
</div>
<!-- 검색창 -->
<div id="detailSearchBar">
<c:set value="${keyword}" var="key"/>
	<nav class="navbar navbar-light  d-flex">
		<div class="container-fluid justify-content-center">
				<input class="form-control me-2 w-25 h-25"  name="searchBar" style='resize : none;overflow:hidden;' value = "${key}">
				<button id="searchSubmit" class="btn btn-outline-success">검색</button>
		</div>
	</nav>
</div>  
<!-- 쿠키값 -->
<%-- <c:set var="tag" value="${param.tag}" />
<c:if test="${not empty cookie.clickedTag}">
	<div id="tagTest">
		<input class="testT"  name="tagtestName" style='display:none' value = "${tag}">
	</div>
</c:if> --%>

<!-- 검색결과창 -->
	 <div class= "searchPop">
		<a href="#">인기순</a>
		<a href="#">조회순</a>
		<a href="#">등록일자순</a>
	</div>
<div class= "searchBoard">
		<c:forEach items="${artList}" var="artlist">
	<div id ="searchResult">	
		<%-- <div class="row">
				<div class="col" id="artResult">
					<div onclick="location.href='/artDetail/detail?seqno=${artlist.seqno}'">
						<div class="image"><img src="${artlist.linkAddress}"></div>
						<div class="webtoonName">${artlist.name}</div>
					</div>
				</div>
				<div class="col">
					<div class ="authorDetail">
						<span>작가:</span>${artlist.author}
					</div>
					<div class ="platformDetail">
						<span>연재처:${artlist.platform }</span>
					</div>
					<div class ="webtoonDetail">
					${artlist.detail}
					</div>
					<div class ="genruDetail">
								<span>장르:</span>
						<c:forEach items="${artlist.tag}" var="midTag"  end="0" >
							${midTag.mid}
						</c:forEach>
					</div>
					<div class ="webtoonHashtag">
						<c:forEach items="${artlist.tag}" var="artTags">
							#<a href="#">${artTags.name} </a>
						</c:forEach>
					</div>
				</div>
				<div class="col">
					<div class="star">
						<h4>별점</h4>
						<h2>${artlist.avgRating} /5.0</h2>
						<!-- <div>★★★★★</div> -->
					</div>
				</div> 
		</div>--%>
	</div>
	</c:forEach> 
</div>
<script type="text/javascript" src="/js/searchDetail.js"></script>
<script>
$(document).ready(function(){
var searchField = $("#detailSearchBar");
var searchBoard = $(".searchBoard");
var key = $(".form-control");
var tagResult = $("#result");
var keywordv = searchField.find("input[name='searchBar']"); 
var tagTest = $("#tagTest");
var tagv = tagTest.find("input[name='tagtestName']"); 
 		
	/* input태그 엔터키입력시 검색결과 나오게 input태그에 keyup이벤트 걸어줌 */
	 $("input").on("keyup",function(key){
         if(key.keyCode==13) {
	       showList(keywordv);	
         }    
     });  
		
	/* 태그 누를때 */
	$('.dropdown-item').on('click',function(e){
		var tagVars = e.target.value;
		console.log('클릭',tagVars);
		tagArtList(tagVars);
	});
			function tagArtList(tagVar){
			searchService.getTag(tagVar,function(list){
				var str = " ";
				 if(list == null || list.length==0){
					$(".searchBoard").html("검색 결과가 없습니다");
					return;
					}  
				 console.log('리스트 길이',list.length);
				for(var i = 0, len=list.length || 0; i<len; i++){
					str+="<div id='searchResult'> <div class='row'>"
					str+="<div class='col' id='artResult'>"
					str+="<div class='image'><img src='"+ list[i].linkAddress +"'></div>"
					str+="<div class='webtoonName'>"+ list[i].name +"</div></div>"
					str+="<div class='col'><div class ='authorDetail'>"
					str+="<span>작가:</span>"+ list[i].author +"</div>"
					str+="<div class ='platformDetail'><span>연재처:</span>"+list[i].platform+"</div>"
					str+="<div class ='webtoonDetail'>"+list[i].detail+"</div>"
					str+="<div class ='genruDetail'><span>장르:#"+list[i].genre+"</span></div>"
					str+="<div class ='webtoonHashtag'>#<a href='#'>"+list[i].tags+" </a></div></div>"
					str+="<div class='col'><div class='star'>"
					str+="<h4>별점</h4> <h2>"+list[i].avgRating+"/5.0</h2> <div>★★★★★</div></div></div>"
					str += "</div></div>" 
				} 
				$(".searchBoard").html(str);
			});
		};
	
		
		
		
		
		$("#searchSubmit").on("click",function(key){
			       showList(keywordv);
		     });
		if(key != null){
			       showList(key);	
 		};
		
		/* 리스트 */
		function showList(keyword){
			searchService.getList(keyword.val(),function(list){
				var str = "";
				console.log("겟리스트 시작", keyword.val()); 
				if(list == null || list.length==0){
					$(".searchBoard").html("검색 결과가 없습니다");
					return;
					} 
				for(var i = 0, len=list.length || 0; i<len; i++){
					str+="<div id='searchResult'> <div class='row'>"
					str+="<div class='col' id='artResult'>"
					str+="<div class='image'><img src='"+ list[i].linkAddress +"'></div>"
					str+="<div class='webtoonName'>"+ list[i].name +"</div></div>"
					str+="<div class='col'><div class ='authorDetail'>"
					str+="<span>작가:</span>"+ list[i].author +"</div>"
					str+="<div class ='platformDetail'><span>연재처:</span>"+list[i].platform+"</div>"
					str+="<div class ='webtoonDetail'>"+list[i].detail+"</div>"
					str+="<div class ='genruDetail'><span>장르:#"+list[i].genre+"</span></div>"
					str+="<div class ='webtoonHashtag'>#<a href='#'>"+list[i].tags+" </a></div></div>"
					str+="<div class='col'><div class='star'>"
					str+="<h4>별점</h4> <h2>"+list[i].avgRating+"/5.0</h2> <div>★★★★★</div></div></div>"
					str += "</div></div>" 
				} 
				$(".searchBoard").html(str);
			}) 
		};
		function mainTotagList(mainTag){
			 console.log('실험 시작');
			searchService.getTag(mainTag,function(list){
				console.log('실험 시작 2');
				var str = " ";
				 if(list == null || list.length==0){
					$(".searchBoard").html("검색 결과가 없습니다");
					return;
					}  
				 console.log('tag리스트 길이',list.length);
				for(var i = 0, len=list.length || 0; i<len; i++){
					str+="<div id='searchResult'> <div class='row'>"
					str+="<div class='col' id='artResult'>"
					str+="<div class='image'><img src='"+ list[i].linkAddress +"'></div>"
					str+="<div class='webtoonName'>"+ list[i].name +"</div></div>"
					str+="<div class='col'><div class ='authorDetail'>"
					str+="<span>작가:</span>"+ list[i].author +"</div>"
					str+="<div class ='platformDetail'><span>연재처:</span>"+list[i].platform+"</div>"
					str+="<div class ='webtoonDetail'>"+list[i].detail+"</div>"
					str+="<div class ='genruDetail'><span>장르:#"+list[i].genre+"</span></div>"
					str+="<div class ='webtoonHashtag'>#<a href='#'>"+list[i].tags+" </a></div></div>"
					str+="<div class='col'><div class='star'>"
					str+="<h4>별점</h4> <h2>"+list[i].avgRating+"/5.0</h2> <div>★★★★★</div></div></div>"
					str += "</div></div>" 
				} 
				$(".searchBoard").html(str);
			});
		};

		var queryString = window.location.search;
		var params = new URLSearchParams(queryString);
		var tagSeqno = params.get('seqno');
		var tagVal = <%=request.getParameter("tag")%>;
		console.log("tagSeq", tagVal);
		
		if(tagVal !== null){
			mainTotagList(tagVal);
			console.log("실행");
	  };
		/* 쿠키로 태그값 가져오기 */
		/* var clickedTag = null;
		const cookies = document.cookie.split(";");
		document.cookie = "clickedTag=myTagValue; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
		for (let i = 0; i < cookies.length; i++) {
			console.log('tagv test for문');
		  const cookie = cookies[i].split("=");
		  if (cookie[0] === "clickedTag") {
		    clickedTag = cookie[1];
		    break;
		  }
		}; */
		
		/* 쿠키를 활용한 리스트출력 */
		<%-- if (clickedTag !== null) {
			var clickedTag = '<%= request.getAttribute("clickedTag") %>';
			  if (clickedTag) {
				  function mainTotagList(tag){
						searchService.getTag(tag.val(),function(list){
							var str = " ";
							 if(list == null || list.length==0){
								$(".searchBoard").html("검색 결과가 없습니다");
								return;
								}  
							 console.log('tag리스트 길이',list.length);
							for(var i = 0, len=list.length || 0; i<len; i++){
								str+="<div id='searchResult'> <div class='row'>"
								str+="<div class='col' id='artResult'>"
								str+="<div class='image'><img src='"+ list[i].linkAddress +"'></div>"
								str+="<div class='webtoonName'>"+ list[i].name +"</div></div>"
								str+="<div class='col'><div class ='authorDetail'>"
								str+="<span>작가:</span>"+ list[i].author +"</div>"
								str+="<div class ='platformDetail'><span>연재처:</span>"+list[i].platform+"</div>"
								str+="<div class ='webtoonDetail'>"+list[i].detail+"</div>"
								str+="<div class ='genruDetail'><span>장르:#"+list[i].genre+"</span></div>"
								str+="<div class ='webtoonHashtag'>#<a href='#'>"+list[i].tags+" </a></div></div>"
								str+="<div class='col'><div class='star'>"
								str+="<h4>별점</h4> <h2>"+list[i].avgRating+"/5.0</h2> <div>★★★★★</div></div></div>"
								str += "</div></div>" 
							} 
							$(".searchBoard").html(str);
						});
					};
					mainTotagList(tagv);
					
			  };
		 }; --%>
});
</script>