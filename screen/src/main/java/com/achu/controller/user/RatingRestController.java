package com.achu.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.achu.dto.Artwork;
import com.achu.dto.Rating;
import com.achu.dto.Reply;
import com.achu.service.ArtworkService;
import com.achu.service.RatingService;
import com.achu.service.ReplyService;

@RestController
@RequestMapping("/ratingRest/")
public class RatingRestController {
	
	@Autowired
	ArtworkService as;
	@Autowired
	ReplyService rs;
	@Autowired
	RatingService ratingService;
	
	//평가하기 -> 추천작품 리스트 조회
	@GetMapping(value ="{id}",
				produces ={MediaType.APPLICATION_XML_VALUE,
						  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Artwork>> ratingList(@PathVariable("id") String id) {
			System.out.println("평가하기 컨트롤러 실행" + id);
			
		return new ResponseEntity<>(as.getRatingList(id),HttpStatus.OK);
	}
	
	// 평가하기 -> 댓글등록시
//	@PostMapping(value = "{ano}")
//	public ResponseEntity<Reply> goReply(){
//		System.out.println("평가하기 댓글 등록 컨트롤러 실행");
//		return new ResponseEntity<>()
//	}
	
	@PostMapping(value="starVal",
			consumes="application/json",
			produces="text/plain; charset=utf-8;")
	public ResponseEntity<String> rating(@RequestBody Rating value){
		System.out.println("평가 등록 rating 컨트롤러 : " + value);
		int rs =ratingService.ratingReg(value);
		return rs == 1 ? new ResponseEntity<>("성공",HttpStatus.OK) 
				: new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
