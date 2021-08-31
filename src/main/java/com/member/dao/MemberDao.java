package com.member.dao;

import com.member.dto.MemberDto;

public interface MemberDao {
	
	String NAMESPACE = "mypage.";
	
	public MemberDto selectOne(String email);
}
