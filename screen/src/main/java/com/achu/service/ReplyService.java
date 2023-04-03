package com.achu.service;


import java.util.List;

import com.achu.dto.Reply;

public interface ReplyService {

	public List<Reply> getReplyList(long ano);

	public int modify(Reply vo);

	public int register(Reply reply);

	public Reply get(String rno );

	public int remove(long rno);
	
}
