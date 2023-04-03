package com.achu.controller.user;



import java.util.List;
import java.util.stream.Collector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.achu.dto.Artwork;
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
	
	//상세검색 검색어 받아오는 메소드
	@RequestMapping(value = "search_new",method = RequestMethod.GET)
	private void ArtSearch(@RequestParam("keyword") String keyword,Model m) {
			Criteria cri = new Criteria();
			cri.setKeyword(keyword);
			m.addAttribute("searchList", tagService.tagList());
			m.addAttribute("artList",artworkService.list(cri));
			m.addAttribute("keyword",keyword);
			m.addAttribute("keyword",artworkService.clickTag(keyword));
		}
//	@PostMapping("search_new_key")
//	public ModelAndView search(@RequestParam("keyword") String keyword) {
//	    List<Artwork> searchResults = artworkService.searchList(keyword);
//	    ModelAndView mav = new ModelAndView("searchResults");
//	    mav.addObject("searchResults", searchResults);
//		mav.addObject("keyword", keyword);
//	    return mav;
//	}

	
	
}


