package com.achu.controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.achu.service.ArtworkService;
import com.achu.service.TagService;

@Controller
@RequestMapping("/artDetail/")
public class ArtDetailController {
	
	@Autowired
	ArtworkService artworkService;
	
	@Autowired
	TagService tagService;
	
	@RequestMapping("detail")
	public String artDetail(Model m,@ModelAttribute("seqno") String seqno) {
		System.out.println("작품 상세정보 컨트롤러 "+seqno);
		m.addAttribute("detail",artworkService.artDetail(seqno));
		return "artDetail";
	}
	@RequestMapping("search_new")
	public String goSearch(Model m) {
		m.addAttribute("searchList", tagService.tagList());
		return "search_new";
	}
}
