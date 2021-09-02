package com.member.dao;

import com.member.dto.MemberDto;

public interface MemberDao {

	String MEMBER_NAMESAPCE="member.";
	String MYPAGE_NAMESPACE = "mypage.";
	
	public MemberDto login(MemberDto reqMember);

	public MemberDto selectOne(String email);

	public int updateInfo(MemberDto dto);

}
