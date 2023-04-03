package com.achu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Tag;

public interface ArtworkService {


	public List<Artwork> list(Criteria aCri) ;
	
	public List<Artwork> list();
	
	public List<Artwork> AchuRecommendArt() ;
	
	public List<Tag> topTag();
	
	public List<Artwork> topTagArt(String seqno);
	
	public List<Artwork> rating(String userId);
	
	public List<Artwork> keywordList(Criteria aCri);

	public Artwork artDetail(String seqno);

	public List<Artwork> Restlist();

	public List<Artwork> searchList(String keyword);

	public int setImageLink(String seqno, String imageLink);

	public String setImageFile(String seqno, MultipartFile file);

	public List<Artwork>  getRatingList(String id);

	public int modify(HashMap<String, String> key);

	public List<Artwork> searchTag(String tag);

	public List<Artwork> myPageArtRating(String id);

	public List<Artwork> myPageArtWdate(String id);

	public List<Artwork> clickTag(String keyword);
	
}