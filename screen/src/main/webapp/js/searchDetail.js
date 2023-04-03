/**
 * 
 */

console.log("Search Detail Module start")

var searchService = (function(){
	
	function getList(keyword,callback, error) {
		 console.log("getList실행",keyword);
			$.getJSON("/searchDetail/search/" + keyword +".json",function(result){
				 if(callback) {
					 callback(result);
					 console.log("성공");
				 }
			 }).fail(function(xhr, status, err){
				if(error) {
					error();
				}
			 });
		 }
	 function getTag(tag,callback, error) {
		 $.getJSON("/searchDetail/searchTag/" + tag+  ".json" ,function(result){
			 if(callback) {
				 callback(result);
				 console.log("성공",tag);
			 }
		 }).fail(function(xhr, status, err){
			 if(error) {
				 error();
			 }
		 });
	 }
	 return { getList: getList,
	 		getTag: getTag};
})();