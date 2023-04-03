package com.achu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Artwork;

public interface SearchMapper {
	public List<Artwork> getSearchList();
	
	public List<Artwork> searchResult(@Param("name") String name);

	public List<Artwork> getTagArtList(@Param("tag_name") String tag);
}
