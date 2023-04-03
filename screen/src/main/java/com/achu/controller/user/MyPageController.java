package com.achu.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.achu.dto.Criteria;
import com.achu.service.ArtworkService;
import com.achu.service.MemberService;
import com.achu.service.MemberServiceImp;
import com.achu.service.PreferenceService;
import com.achu.service.PreferenceServiceImp;
import com.achu.service.TagService;

@Controller
@RequestMapping("/mypage/")
public class MyPageController  {
       
	@Autowired
	PreferenceService preferenceService;
	@Autowired
	MemberService memberService;
	@Autowired
	TagService tagService;
	@Autowired
	ArtworkService artworkService;
    @RequestMapping(value="mypage")
	private void Mypage( )  {
    }		
    
    @GetMapping("preference")
	public void Prefer(Model m, HttpSession sess) {
    		String id =(String) sess.getAttribute("sess_id");
			m.addAttribute("Preference", preferenceService.MyRatingInfo(id));
			m.addAttribute("FavoriteTagCount", preferenceService.MyRatingFavoriteTag(id));
			m.addAttribute("MostGenre", preferenceService.MyRatingMostGenre(id));
			m.addAttribute("FavoriteGenre", preferenceService.MyRatingFavoriteGenre(id));
			m.addAttribute("CountGenre", preferenceService.MyRatingCountGenre(id));
			m.addAttribute("Platform", preferenceService.MyRatingPlatform(id));
			m.addAttribute("Chart", preferenceService.Chart(id));
    }
	  @RequestMapping("checkArt")
	  public void checkArt(Model m, HttpSession sess) { 
		  String id =(String) sess.getAttribute("sess_id");
		  m.addAttribute("artAvg", preferenceService);
	  } 
	  @RequestMapping("friend")
	  public void friend() {
	  }
	  @RequestMapping(value = "search_new",method = RequestMethod.GET)
		private void ArtSearch(@RequestParam("keyword") String keyword,Model m) {
				Criteria cri = new Criteria();
				cri.setKeyword(keyword);
				m.addAttribute("searchList", tagService.tagList());
				m.addAttribute("artList",artworkService.list(cri));
				m.addAttribute("keyword",keyword);
			}  
//	  }
//	
//	  else if(cmd.equals("friendSearch")) {
//		  Criteria fCri = new Criteria("friend","id",req.getParameter("id"));
//	  if(memberService.list(fCri)!=null) { req.setAttribute("search", "ok"); };
//	  goView(req, resp, "/friend.jsp"); }
//	  
//	  }
//	 
}
