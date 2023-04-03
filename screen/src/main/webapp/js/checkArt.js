
 console.log("mypage Detail Module start")
var checkArtService = (function(){
	function getArtList(id,callback,error){
		$.getJSON("/MyPageDetail/checkArt/" + id +".json",function(result){
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
	function getArtListDate(id,callback,error){
		$.getJSON("/MyPageDetail/getArtListDate/" + id +".json",function(result){
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
	return {getArtList:getArtList,
			getArtListDate:getArtListDate};
})();