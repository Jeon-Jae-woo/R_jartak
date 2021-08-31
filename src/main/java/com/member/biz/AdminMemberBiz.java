package com.member.biz;

import java.util.List;

import com.member.dto.MemberDto;
import com.util.pagingDto;

public interface AdminMemberBiz {
	
	//회원 목록
	public List<MemberDto> memberList(int pageNum);
	//회원 목록 페이징
	public pagingDto memberListPaging(int pageNum);
}
