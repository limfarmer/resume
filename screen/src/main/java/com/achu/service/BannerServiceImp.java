package com.achu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.BannerDaoImp;

import com.achu.dto.File;

@Service
public class BannerServiceImp implements BannerService{
	@Autowired
	BannerDaoImp bannerDao;
	public List<File> bannerImage() {
		return bannerDao.banner();
	}
}
