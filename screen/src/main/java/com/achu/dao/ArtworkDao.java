package com.achu.dao;

import java.util.List;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Tag;
public interface ArtworkDao {
	public List<Artwork> list(Criteria aCri);
	
	public List<Artwork> AchuRecommendArt();
	
	public List<Tag> topTag();
	
	public List<Artwork> topTagArt(String seqno);
	
	public List<Artwork> Rating(String userId);

	List<Artwork> keywordList(Criteria aCri);

	public Artwork artDetail(String seqno);


}
