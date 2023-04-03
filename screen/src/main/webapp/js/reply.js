/**
 * 
 */
 console.log("Reply Module start")
 
  var replyService = (function(){
	  // 댓글 등록
	  function add(reply,callback) {
		  $.ajax({
			  type : 'POST',
			  url : '/reply/add',
			  data : JSON.stringify(reply),
			  contentType : 'application/json; charset=utf-8',
			  success : function(result, status, xhr){
				  if(callback) {
					  callback(result);
				  }
			  },error : function(xhr,status,er){
					 if(error) {
						 error(er);
					 }
				 }
		  });
	  }
	  // 댓글 수정시 댓글seqno 받아오기	  
	  function get(rno,callback,error) {
		  console.log("get 메소드 실행" + rno);
			 $.getJSON("/reply/get/" + rno + ".json" , function(result){
				 if(callback) {
					 callback(result);
				 }
			 }).fail(function(xhr, status, err){
				if(error) {
					error();
				}
			 });
		 }
	  /* 댓글 리스트 */
	 function getReply(ano, callback, error) {
		 console.log("ano 넘어오는가" + ano);
		 $.getJSON("/reply/list/"  + ano + ".json" , function(data){
			 if(callback) {
				 callback(data);
				/* console.log("리스트 성공");*/
				 
			 }
		 }).fail(function(xhr, status , err){
			 if(error) {
				 error();
			 }
		 });
		 
	 }
	 
	 /* 댓글 수정 */
	 function modify(reply,callback,error) {
		 console.log("수정 실행");
		 $.ajax({
			type : 'put',
			url : '/reply/'+ reply.seqno,
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(reply),
			 success:function(result,status,xhr){
				 if(callback) {
					 callback(result);
					 console.log("수정 성공");
				 }
			 },
			 error : function(){
				 if(error) {
					 error(er);
				 }
			 }
		 });
	 }
	 //삭제
	 function remove(rno,callback,error) {
		 console.log("댓글 삭제" + rno);
		 $.ajax({
			type : 'delete',
			url : "/reply/" + rno,
			success:function(result,status,xhr){
				if(callback) {
					callback(result);
				}
			},
			erorr:function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		 });
		 
	 }
	 
	 return {getReply : getReply,
		 	 modify : modify,
		 	 add : add,
		 	 get : get,
		 	remove : remove};
  })();