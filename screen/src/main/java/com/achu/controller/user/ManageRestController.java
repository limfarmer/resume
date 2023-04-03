package com.achu.controller.user;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.ListPage;
import com.achu.dto.Member;
import com.achu.dto.Tag;
import com.achu.service.ArtworkService;
import com.achu.service.MemberService;
import com.achu.service.TagService;

@Controller
@RequestMapping(value="/adminRest/")
public class ManageRestController {
	
	private static final Logger log = LoggerFactory.getLogger("ManageRestController.class");
	
	@Autowired
	TagService tagService;
	@Autowired
	MemberService memberService;
	@Autowired
	ArtworkService artworkService;
	
	
	@RequestMapping(value="memberList", method = {RequestMethod.GET,RequestMethod.POST},produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ListPage> memberList(@RequestBody Criteria cri) {
		if(cri.getCurrentPage()==0) cri.setCurrentPage(1);
		if(cri.getLength()==0) cri.setLength(10);
		if(cri.getSearchField()==null) cri.setSearchField("id");
		if(cri.getKind() == null) cri.setKind("all");
		List<Member> members = memberService.list(cri);
		return new ResponseEntity<>(new ListPage(members.size(),cri,members),HttpStatus.OK);
	}
	
	@RequestMapping(value="artList", method = {RequestMethod.GET,RequestMethod.POST},produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ListPage> artList(@RequestBody Criteria cri) {
		if(cri.getCurrentPage()==0) cri.setCurrentPage(1);
		if(cri.getLength()==0) cri.setLength(10);
		if(cri.getSearchField()==null) cri.setSearchField("id");
		if(cri.getKind() == null) cri.setKind("all");
		List<Artwork> artworks = artworkService.list(cri);
		return new ResponseEntity<>(new ListPage(artworks.size(),cri,artworks),HttpStatus.OK);
	}

	
	@GetMapping(value="tagList")
	public ResponseEntity<List<Tag>> tag() {
		log.info("tagList Mapping OK");
		return new ResponseEntity<>(tagService.tagListRest(),HttpStatus.OK);
	}
	
	@PostMapping(value="tagInsert/{tagName}", produces= {"text/plain; charset=utf-8" })
	public ResponseEntity<String> tagInsert(@PathVariable("tagName") String tagName) {
		return tagService.register(tagName)==1? new ResponseEntity<>("태그 등록 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="tagModify", 
					method= {RequestMethod.PUT, RequestMethod.PATCH},
					produces={"text/plain; charset=utf-8"})
	public ResponseEntity<String> tagModify(@RequestBody Tag tag) {
		return tagService.edit(tag.getSeqno(),tag.getName())==1? new ResponseEntity<>("태그 수정 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="tagDelete/{tno}", produces="text/plain; charset=utf-8")
	public ResponseEntity<String> tagDelete(@PathVariable("tno") String seqno) {
		log.info("tag DELETE Mapping OK");
		int rs=tagService.remove(seqno);
		log.info("tag DELETE result : " +rs);
		return rs==-1? new ResponseEntity<>("태그 삭제 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="tagConfirm/{tagName}",produces="text/plain; charset=utf-8")
	public ResponseEntity<String> tagConfirm(@PathVariable("tagName") String tagName){
		String rs=String.valueOf(tagService.confirm(tagName));
			ResponseEntity<String> result = null; 
			if(rs.equals("0")||rs.equals("1")) {
				result = new ResponseEntity<>(rs, HttpStatus.OK);
			}else {
				result=new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		return result;
	}
	
	@GetMapping(value="getInfo/{seqno}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Artwork> getInfo(@PathVariable("seqno") String seqno){
		//System.out.println("ManageRestController artModify seqno:"+seqno);
		return new ResponseEntity<>(artworkService.artDetail(seqno), HttpStatus.OK);
	}
	
	@PostMapping(value="setImageLink/{seqno}", produces={"text/plain; charset=utf-8"})
	public ResponseEntity<String> setImage(@PathVariable("seqno") String seqno, @RequestBody String imageLink) {
		//System.out.println(seqno);
		//System.out.println(ImageLink);
		imageLink=imageLink.replaceAll("\"", "");
		System.out.println("콘트롤러 이미지 링크:"+imageLink);
		//artworkService.setImageLink(seqno,imageLink);
		return artworkService.setImageLink(seqno,imageLink)==1? new ResponseEntity<>("이미지 추가 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PostMapping(value="setImageFile/{seqno}",produces="text/plain; charset=utf-8")
	public ResponseEntity<String> setImageFile(@PathVariable("seqno") String seqno, @RequestBody MultipartFile file){
		System.out.println(file);
		return new ResponseEntity<>(artworkService.setImageFile(seqno,file), HttpStatus.OK);
	}
	
	@PostMapping(value="artModify/{seqno}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> artModify(@PathVariable("seqno") String seqno, @RequestBody HashMap<String,String> key){
		//System.out.println("ManageRestController artModify seqno:"+seqno);
		key.put("seqno", seqno);
		System.out.println(key);
		return artworkService.modify(key)==1? new ResponseEntity<>("수정 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="tagSearch/{seqno}/{keyword}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Tag>> tagSearch(@PathVariable("seqno") String seqno ,@PathVariable("keyword") String keyword){
		System.out.println("ManageRestController tagSearch keyword:"+keyword);
		return new ResponseEntity<>(tagService.tagSearch(seqno,keyword), HttpStatus.OK);
	}
	
	@GetMapping(value="artTagInsert/{seqno}/{tagSeq}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> artTagInsert(@PathVariable("seqno") String seqno ,@PathVariable("tagSeq") String tagSeq){
		System.out.println("ManageRestController tagInsert called seqno:"+seqno+", tagSeq:"+tagSeq);
		return tagService.artTagInsert(seqno,tagSeq)==1? new ResponseEntity<>("추가완료", HttpStatus.OK) :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@GetMapping(value="artTagDelete/{seqno}/{tagSeq}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> artTagDelete(@PathVariable("seqno") String seqno ,@PathVariable("tagSeq") String tagSeq){
		System.out.println("ManageRestController tagInsert called seqno:"+seqno+", tagSeq:"+tagSeq);
		return tagService.artTagDelete(seqno,tagSeq)==1? new ResponseEntity<>("삭제완료", HttpStatus.OK) :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
