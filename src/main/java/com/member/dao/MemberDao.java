package com.member.dao;

import com.member.dto.MemberDto;

public interface MemberDao {
	String NAMESAPCE="member.";
	
	public MemberDto login(MemberDto reqMember);
}
