package com.achu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dto.Rating;
import com.achu.mapper.RatingMapper;

@Service
public class RatingServiceImp implements RatingService {
	
	@Autowired
	RatingMapper rm;
	
	@Override
	public int ratingReg(Rating value) {
		System.out.println("평가 등록 rating 서비스 임플리 : " + value);
		return rm.ratingReg(value);
	}

}
