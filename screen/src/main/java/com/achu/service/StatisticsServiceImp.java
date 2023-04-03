package com.achu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.MemberDao;
import com.achu.dao.MemberDaoImp;
import com.achu.dao.RatingDao;
import com.achu.dao.ReplyDao;
@Service
public class StatisticsServiceImp implements StatisticsService{

	@Autowired
	MemberDao memberDao;
	@Autowired
	RatingDao ratingDao ;
	@Autowired
	ReplyDao replyDao;
	
	public Map<String, Integer> manageMainStatistics() {
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		Map<String,Integer> mStatistics = memberDao.manageMainStatistics();
		Map<String,Integer> rStatistics = ratingDao.manageMainStatistics();
		Map<String,Integer> rpStatistics = replyDao.manageMainStatistics();
		
		
		statistics.put("totalMember", mStatistics.get("totalMember"));
		statistics.put("newMember", mStatistics.get("newMember"));
		statistics.put("totalRating", rStatistics.get("totalRating"));
		statistics.put("newRating", rStatistics.get("newRating"));
		statistics.put("totalReply", rpStatistics.get("totalReply"));
		statistics.put("newReply", rpStatistics.get("newReply"));
		
		return statistics;
	}

}
