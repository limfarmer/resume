package com.achu.service;

import java.util.List;

import com.achu.dto.Tag;

public interface TagService {
	public List<Tag> tagList() ;

	public String insert(String tagName);

	public String modify(String seqno, String newName);

	public void delete(String seqno);

	//이 아래로 mybatis-jquery 적용 용도
	public int register(String tagName);

	public List<Tag> tagListRest();

	public int edit(String seqno, String newName);
	
	public int remove(String seqno);

	public int confirm(String tagName);

	public List<Tag> tagSearch(String seqno, String keyword);

	public int artTagInsert(String seqno, String tagSeq);

	public int artTagDelete(String seqno, String tagSeq);

}
