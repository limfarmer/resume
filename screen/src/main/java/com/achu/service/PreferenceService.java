package com.achu.service;

import java.util.List;

import com.achu.dto.Artwork;
import com.achu.dto.Average;
import com.achu.dto.Tag;

public interface PreferenceService {
	public Average MyRatingInfo(String userId);
	
	public List<Tag> MyRatingFavoriteTag(String userId);
	
	public List<Tag> MyRatingMostGenre(String userId);
	
	public List<Tag>MyRatingFavoriteGenre(String userId);
	
	public List<Tag>MyRatingCountGenre(String userId);
	
	public List<Artwork>MyRatingPlatform(String userId);
	
	public List<Artwork>Chart(String userId);
}
