package com.achu.dao;

import java.util.List;
import java.util.Map;

import com.achu.dto.Criteria;
import com.achu.dto.Member;

public interface MemberDao {
	public Map<String, String> login(String id, String pw) ;

	public Map<String,Integer> manageMainStatistics() ;
	
	public List<Member> list(Criteria mCri);
	
}

