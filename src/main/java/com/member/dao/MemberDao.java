package com.member.dao;

import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

public interface MemberDao {

	String MEMBER_NAMESAPCE="member.";
	String MYPAGE_NAMESPACE = "mypage.";
	
	public MemberDto login(MemberDto reqMember);

	public MemberDto selectOne(String email);


	public MemberRankDto rank(int rank_no);

	//회원 상태 변경, nickname으로 찾고 변경, 이메일로 필요하면 오버로딩
	public int ChangeStatus(String nickname, int status_no);

}
