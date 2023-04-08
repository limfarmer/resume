package com.achu.controller.user;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.achu.dto.Criteria;
import com.achu.service.ArtworkService;
import com.achu.service.MemberService;
import com.achu.service.TagService;

@Controller
public class SearchController {

	@Autowired
	TagService tagService;
	@Autowired
	ArtworkService artworkService;
	@Autowired
	MemberService ms;
	
//	@RequestMapping(value = "search_new",method = RequestMethod.GET)
//	private void ArtSearch(@RequestParam("artKeyword") String keyword,Model m) {
//			Criteria cri = new Criteria();
//			cri.setKeyword(keyword);
//			m.addAttribute("searchList", tagService.tagList());
//			m.addAttribute("artList",artworkService.list(cri));
//			m.addAttribute("keyword",keyword);
//		}
//	@RequestMapping(value = "search_new/tags",method = RequestMethod.GET)
//	private void ArtTagSearch(@RequestParam("tag") String keyword,Model m) {
//		Criteria cri = new Criteria();
//		cri.setKeyword(keyword);
//		m.addAttribute("tag",artworkService.clickTag(keyword));
//	}

	//상세검색 검색어 받아오는 메소드
	@RequestMapping(value = "search_new", method = RequestMethod.GET)
	private String search(@RequestParam(name = "artKeyword", required = false) String artKeyword,
	                    @RequestParam(name = "tag", required = false) String tag,
	                    Model m) {
	    Criteria cri = new Criteria();
	    m.addAttribute("searchList", tagService.tagList());
	    m.addAttribute("artList",artworkService.list(cri));
	    if (artKeyword != null) {
	        cri.setKeyword(artKeyword);
	        m.addAttribute("keyword", artKeyword);
	    } else if (tag != null) {
	        cri.setKeyword(tag);
	        m.addAttribute("tag",artworkService.clickTag(tag));

	    }
	    return "/search_new";
	}

}


