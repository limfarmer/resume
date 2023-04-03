package com.achu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Tag;

public interface TagMapper {

	int insert(String tagName);

	List<Tag> list();

	int edit(@Param("seqno") String seqno,@Param("newName") String newName);

	int remove(String seqno);

	int confirm(String tagName);

	List<Tag> tagSearch(@Param("seqno") String seqno, @Param("keyword") String keyword);

	int artTagInsert(@Param("seqno") String seqno, @Param("tagSeq") String tagSeq);

	int artTagDelete(@Param("seqno") String seqno, @Param("tagSeq") String tagSeq);

	/*Integer insert(Map<String,Object> rs);*/

}
