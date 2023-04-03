package com.achu.dao;

import java.util.List;

import com.achu.dto.Tag;

public interface TagDao {
	public List<Tag> tagList();
	
	public int insert(String tagName);
	
	public int modify(String seqno, String newName);

	public void delete(String seqno);
}
