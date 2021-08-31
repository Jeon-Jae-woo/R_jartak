package com.member.biz;

import com.member.dto.MemberDto;

public interface MemberBiz {

	public MemberDto selectOne(String email);
}
