package com.member.biz;

import com.amount.dto.BankAccountDto;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;


public interface MemberBiz {
	 public MemberDto login(MemberDto reqMember);

	 public MemberDto selectOne(String email);
	 

	 public int insert(MemberDto dto);

	 public int updateInfo(MemberDto dto);
	 
	 public int updateInfo_Emoney(MemberDto dto);
	 
	 public MemberRankDto rank(int rank_no);
	 
	 public int deleteInfo(String email);
	 
	 //닉네임 회원 조회
	 public MemberDto selectOneNickBiz(String nickname);

	 public int insertBank(BankAccountDto bankacc);
	 

 
}
