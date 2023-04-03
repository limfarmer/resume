package com.achu.service;

import java.util.List;
import java.util.Map;

import com.achu.dto.Criteria;
import com.achu.dto.Member;

public interface MemberService {
	public Map<String, String> login(String id, String pw) ;

	public List<Member> list(Criteria mCri);

	public int delete();
}
