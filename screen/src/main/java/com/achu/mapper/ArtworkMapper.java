package com.achu.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Artwork;
import com.achu.dto.Image;

public interface ArtworkMapper {

	public Artwork getArtwork(String seqno) ;

	public int setImageLink(@Param("seqno") String seqno, @Param("imageLink") String imageLink);

	public String setImageFile(@Param("seqno") String seqno, @Param("image") Image image);
	
	public List<Artwork> getRatingList(@Param("id") String id);

	public int modify(HashMap<String, String> key);

	public List<Artwork> myPageArtRating(@Param("id") String id);

	public List<Artwork> myPageArtWdate(@Param("id") String id);

	public List<Artwork> clickTag(@Param("seqno")String keyword);
	
}
