package com.member.dao;

import java.util.List;

import com.member.dto.MemberDto;

public interface AdminMemberDao {
	String NAMESPACE = "admin.";
	
	//회원 목록
	public List<MemberDto> memberList(int pageNum);
	//회원 목록 페이징
	public int memberListCount();
	
}
