package com.achu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.MemberDao;
import com.achu.dto.Criteria;
import com.achu.dto.Member;
import com.achu.mapper.MemberMapper;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	MemberMapper mapper;

	@Override
	public Map<String, String> login(String id, String pw) {
		return memberDao.login(id, pw);
	}

	@Override
	public List<Member> list(Criteria mCri){
		return memberDao.list(mCri);
	}

	@Override
	public int delete() {
		return mapper.delete();
	}

}
