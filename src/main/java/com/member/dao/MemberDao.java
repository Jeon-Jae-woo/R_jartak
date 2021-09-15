package com.member.dao;

import com.amount.dto.BankAccountDto;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

public interface MemberDao {

	String MEMBER_NAMESAPCE="member.";
	String MYPAGE_NAMESPACE = "mypage.";
	
	public MemberDto login(MemberDto reqMember);

	public MemberDto selectOne(String email);
	
	public int insert(MemberDto dto);

	public int updateInfo(MemberDto dto);
	
	public int updateInfo_Emoney(MemberDto dto);

	public MemberRankDto rank(int rank_no);

	//회원 상태 변경, nickname으로 찾고 변경
	public int ChangeStatus(String nickname, int status_no);

	public int deleteInfo(String email);
	
	public MemberDto selectOneNick(String nickname);

	
	public int insertBank(BankAccountDto bankacc);
	
}
