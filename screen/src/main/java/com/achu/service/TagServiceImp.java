package com.achu.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.TagDao;
import com.achu.dto.Tag;
import com.achu.mapper.TagMapper;

@Service
public class TagServiceImp implements TagService {
	
	private static final Logger log = LoggerFactory.getLogger("TagServiceImp.class");
	
	@Autowired
	private TagMapper mapper;
	
	@Autowired
	TagDao tagDao;
	
	@Override
	public List<Tag> tagList() {
		return tagDao.tagList();
	}

	@Override
	public String insert(String tagName) {
		String msg="";
		int rs =tagDao.insert(tagName);
		if(rs==0) {
			msg="InsertSuccess";
		}else {
			msg="DuplicateTag";
		}
		return msg;
	}

	@Override
	public String modify(String seqno, String newName) {
		String msg="";
		int rs =tagDao.modify(seqno,newName);
		if(rs==0) {
			msg="ModifySuccess";
		}else {
			msg="DuplicateTag";
		}
		return msg;
	}
	
	@Override
	public void delete(String seqno) {
		tagDao.delete(seqno);
	}
	
	//이 아래로 mybatis-jquery 적용 용도
	@Override
	public int register(String tagName) {
		log.info("tag register service called..."+tagName);
		return mapper.insert(tagName);
	}

	@Override
	public List<Tag> tagListRest() {
		log.info("tag List service called...");
		return mapper.list();
	}

	@Override
	public int edit(String seqno, String newName) {
		log.info("tag edit service called...");
		return mapper.edit(seqno,newName);
	}

	@Override
	public int remove(String seqno) {
		log.info("tag remove service called...");
		return  mapper.remove(seqno);
	}

	@Override
	public int confirm(String tagName) {
		log.info("tag confirm service called...");
		return mapper.confirm(tagName);
	}

	@Override
	public List<Tag> tagSearch(String seqno, String keyword) {
		log.info("tag tagSearch service called...");
		return mapper.tagSearch(seqno, keyword);
	}

	@Override
	public int artTagInsert(String seqno, String tagSeq) {
		log.info("tag tagInsert service called...");
		return mapper.artTagInsert(seqno, tagSeq);
	}

	@Override
	public int artTagDelete(String seqno, String tagSeq) {
		log.info("tag tagDelete service called...");
		return mapper.artTagDelete(seqno, tagSeq);
	}
}
