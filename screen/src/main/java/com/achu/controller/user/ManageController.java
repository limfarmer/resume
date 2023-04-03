package com.achu.controller.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Member;
import com.achu.dto.Page;
import com.achu.service.ArtworkService;
import com.achu.service.MemberService;
import com.achu.service.StatisticsService;
import com.achu.service.TagService;

@Controller
@RequestMapping(value="/admin/")
public class ManageController {
	
	@Autowired
	StatisticsService statisticsService;
	@Autowired
	MemberService memberService;
	@Autowired
	ArtworkService artworkService;
	@Autowired
	TagService tagService;
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public String manage() {
		return "/manage/manage_login";
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String main(Model model) {
		Map<String, Integer> statistics = statisticsService.manageMainStatistics();
		model.addAttribute("statistics",statistics);
		return "/manage/manage_index";
	}
	
	@RequestMapping(value="member", method = {RequestMethod.GET,RequestMethod.POST})
	public String member(Criteria cri, Model model, @ModelAttribute("kind") String kind) {
		if(cri.getCurrentPage()==0) cri.setCurrentPage(1);
		if(cri.getLength()==0) cri.setLength(10);
		if(cri.getSearchField()==null) cri.setSearchField("id");
		if(kind == null) kind ="all";
		cri.setKind(kind);
		List<Member> members = memberService.list(cri);
		model.addAttribute("members",new Page(members.size(),cri,members));
		model.addAttribute("criteria",cri);
		return "/manage/manage_members";
	}
	
	@RequestMapping(value="memberDelete",method = {RequestMethod.GET})
	public String memberDelete() {
		memberService.delete();
		return "redirect:/admin/member?kind=del";
	}
	
	@RequestMapping(value="artwork", method = {RequestMethod.GET,RequestMethod.POST})
	public String artwork(Criteria cri, Model model) {
		if(cri.getCurrentPage()==0) cri.setCurrentPage(1);
		if(cri.getLength()==0) cri.setLength(10);
		if(cri.getSearchField()==null) cri.setSearchField("name");
		List<Artwork> artList = artworkService.list(cri);
		
		model.addAttribute("artworkList",new Page(artList.size(),cri,artList));
		model.addAttribute("criteria",cri);
		return "/manage/manage_arts";
	}

	@RequestMapping(value="artworkRequest", method = {RequestMethod.GET,RequestMethod.POST})
	public String artworkRequest(Criteria cri, Model model) {
		if(cri.getCurrentPage()==0) cri.setCurrentPage(1);
		if(cri.getLength()==0) cri.setLength(10);
		if(cri.getSearchField()==null) cri.setSearchField("name");
		cri.setKind("request");
		
		model.addAttribute("artRequest",artworkService.list(cri));
		model.addAttribute("criteria",cri);
		return "/manage/manage_arts_request";
	}
	
	@RequestMapping(value="tag", method = RequestMethod.GET)
	public String tag(Model model) {
		model.addAttribute("tagList", tagService.tagList());
		return "/manage/manage_tags";
	}
	
	/*	@RequestMapping(value="tagInsert", method = RequestMethod.POST)
		public String tagInsert(@RequestParam("tagName") String tagName,Model model) {
			model.addAttribute("msg", tagService.insert(tagName));
			return "redirect:/admin/tag";
		}
		
		@RequestMapping(value="tagModify", method = RequestMethod.POST)
		public String tagModify(@RequestParam("seqno") String seqno,@RequestParam("newName") String newName,Model model) {
			model.addAttribute("msg", tagService.modify(seqno,newName));
			return "redirect:/admin/tag";
		}
		
		@RequestMapping(value="tagDelete", method = RequestMethod.POST)
		public String tagDelete(@RequestParam("seqno") String seqno,Model model) {
			tagService.delete(seqno);
			return "redirect:/admin/tag";
		}*/
	
	@RequestMapping(value="artModify/{seqno}", method = RequestMethod.GET)
	public String artModify(@PathVariable("seqno") String seqno,Model model) {
		model.addAttribute("seqno",seqno);
		//model.addAttribute("info",artworkService.artDetail(seqno));
		//System.out.println("ManageController artModify Called..."+seqno);
		return "/manage/artModify";
	}
}
