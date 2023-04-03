package com.achu.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.achu.dto.Reply;

public interface ReplyMapper {
	
	public Reply read (@Param("rno") String rno);

	public int insert(Reply reply);

	public List<Reply> getReplyList( @Param("ano") long ano);

	public int modify(Reply vo);

	public int remove(long rno);
}
