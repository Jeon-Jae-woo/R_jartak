package com.member.biz;

import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;


public interface MemberBiz {
	 public MemberDto login(MemberDto reqMember);

	 public MemberDto selectOne(String email);
	 
	 public int updateInfo(MemberDto dto);
	 
	 public MemberRankDto rank(int rank_no);
}
