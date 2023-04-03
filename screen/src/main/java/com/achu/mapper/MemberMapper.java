package com.achu.mapper;

import com.achu.dto.Member;

public interface MemberMapper {
	public Member getById(String id);

	public int delete();
	
}
