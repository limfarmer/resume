package com.achu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.PreferenceDaoImp;

import com.achu.dto.Artwork;
import com.achu.dto.Average;
import com.achu.dto.Tag;

@Service
public class PreferenceServiceImp implements PreferenceService {
	
	@Autowired
	PreferenceDaoImp preferenceDao;
	
	public Average MyRatingInfo(String userId) {
		return preferenceDao.MyRatingInfo(userId);
	}
	public List<Tag> MyRatingFavoriteTag(String userId) {
		return preferenceDao.MyRatingFavoriteTag(userId);
	}
	public List<Tag> MyRatingMostGenre(String userId) {
		return preferenceDao.MyRatingMostGenre(userId);
	}
	public List<Tag>MyRatingFavoriteGenre(String userId) {
		return preferenceDao.MyRatingFavoriteGenre(userId);
	}
	public List<Tag>MyRatingCountGenre(String userId) {
		return preferenceDao.MyRatingCountGenre(userId);
	}
	public List<Artwork>MyRatingPlatform(String userId) {
		return preferenceDao.MyRatingPlatform(userId);
	}
	public List<Artwork>Chart(String userId) {
		return preferenceDao.Chart(userId);
	}
}
