package com.member.dao;

import com.member.dto.MemberDto;

public interface MemberDao {

	String NAMESAPCE="member.";
	String NAMESPACE2 = "mypage.";
	
	public MemberDto login(MemberDto reqMember);

	public MemberDto selectOne(String email);

}
