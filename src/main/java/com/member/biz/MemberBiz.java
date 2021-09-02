package com.member.biz;

import com.member.dto.MemberDto;


public interface MemberBiz {
	 public MemberDto login(MemberDto reqMember);

	 public MemberDto selectOne(String email);
	 
	 public int updateInfo(MemberDto dto);
}
