/**
 *  평가하기 페이지
 */
 
 console.log("rating service start");
 
 var ratingService = (function(){
	function list(id , callback){
		console.log("list 함수시작");
		$.getJSON("/ratingRest/" + id + ".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status ,err){
			if(error){
				error();
			}
		});
	}
	function rating(ratingStar,callback){
		console.log("rating function  실행 " , ratingStar);
		$.ajax({
			type : 'POST',
			url : '/ratingRest/starVal',
			data : JSON.stringify(ratingStar),
			contentType : 'application/json; charset=utf-8',//application/x-www-form-urlencoded; charset=UTF-8
			success :function(result, status, xhr){
				  if(callback) {
					  callback(result);
				  }
			  },error : function(xhr,status,er){
					 if(er) {
						 error(er);
					 }
				 }
		});
	}
	return {list : list,
		rating : rating};
})();