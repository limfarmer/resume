package com.achu.controller.user;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.achu.dto.Criteria;
import com.achu.service.ArtworkService;
import com.achu.service.ArtworkServiceImp;
import com.achu.service.BannerService;
import com.achu.service.BannerServiceImp;
import com.achu.service.TagService;

@Controller
@RequestMapping(value = "/", method = RequestMethod.GET)
public class MainController  {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	BannerService bannerService;
	@Autowired
	ArtworkService artworkService;
	@Autowired
	TagService tagService;
	
	
	@RequestMapping("")
	private String goHome(Model m) {
		
		m.addAttribute("Banner",bannerService.bannerImage());
		m.addAttribute("mainChu",artworkService.AchuRecommendArt());
		
		
		m.addAttribute("mainTopTag"+0, artworkService.topTag());
		
			
		for(int i =0; i < artworkService.topTag().size(); i++) {
		String seqno = artworkService.topTag().get(i).getSeqno();
		m.addAttribute("mainTag"+i,artworkService.topTagArt(seqno) );
		}
		return "main";
	}
	//이밑은 아직 미구현 (매핑만함)
	@RequestMapping("rating")
	public void rating() {
	}
//	@RequestMapping("artSearch")
//	public String artSearch(Model m,
//							@ModelAttribute("searchArt") Criteria cri) {
//		m.addAttribute("keyword",artworkService.keywordList(cri));
//		return "search_new";
//	}
	
}