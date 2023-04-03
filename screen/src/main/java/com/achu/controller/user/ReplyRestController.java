package com.achu.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.achu.controller.user.ReplyRestController;
import com.achu.dto.Reply;
import com.achu.service.ReplyService;

@RestController
@RequestMapping("/reply/")
public class ReplyRestController {
	private static final Logger log = LoggerFactory.getLogger(ReplyRestController.class);
	
	@Autowired
	ReplyService service;
	// 리스트 불러오는 컨트롤러
	@GetMapping(value ="list/{ano}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Reply>> getReply(@PathVariable("ano") Long ano){
		System.out.println("Replycontroller 에 ano값 널떠서 디버깅 : " + ano);
		return new ResponseEntity<>(service.getReplyList(ano),HttpStatus.OK);
	}
	
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
			value="{rno}",
			produces="text/plain; charset=utf-8")
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno,
									 @RequestBody Reply vo){
		log.info("++++++++++++++++++rest controller modify called++++++++++++++++++");
		log.info("rno : " + vo.getSeqno());
		log.info("content : " + vo.getContent());
		return service.modify(vo) == 1 ? new ResponseEntity<>("댓글 수정 완료",HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글등록
	@PostMapping(value="add",
			 consumes = "application/json",
			 produces= "text/plain; charset=utf-8") // consumes 요청할때 데이터 요청 방식
	public ResponseEntity<String> create(@RequestBody Reply r){
		System.out.println("ReplyController create() called.."+r);
		int rs =service.register(r);
	
		return rs == 1 ? new ResponseEntity<>("성공",HttpStatus.OK) 
			: new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
}
	@GetMapping(value="get/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}
					)
	public ResponseEntity<Reply> get(@PathVariable("rno") String rno
									 ){
		log.info("get reply..." + rno);
		return new ResponseEntity<>(service.get(rno),HttpStatus.OK);
	}
	

	@DeleteMapping(value="{rno}", produces="text/plain; charset=utf-8")
	public ResponseEntity<String> remove(@PathVariable("rno") long rno){
		log.info("delete rno :" + rno);
		System.out.println("syso delete rno :" + rno );
		return service.remove(rno) == 1? new ResponseEntity<>("댓글 삭제 완료",HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
	
