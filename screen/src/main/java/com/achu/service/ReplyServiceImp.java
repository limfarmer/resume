package com.achu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dto.Reply;
import com.achu.mapper.ReplyMapper;

@Service
public class ReplyServiceImp implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public List<Reply> getReplyList(long ano) {
		System.out.println("ReplyService ano널떠서 디버깅 : " + ano);
		return mapper.getReplyList(ano);
	}
	public int modify(Reply vo) {
		return mapper.modify(vo);
	}
	@Override
	public int register(Reply r) {
		return mapper.insert(r);
	}
	@Override
	public Reply get(String rno) {
		System.out.println("서비스임플리 넘어가나" + rno );
		return mapper.read(rno);
	}
	@Override
	public int remove(long rno) {
		return mapper.remove(rno);
	};
}
