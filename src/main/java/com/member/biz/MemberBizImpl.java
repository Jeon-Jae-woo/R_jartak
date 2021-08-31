package com.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.member.dao.MemberDao;
import com.member.dto.MemberDto;

import com.member.dao.MemberDao;
import com.member.dto.MemberDto;

@Service
@Transactional
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao memberdao;
	
	@Override
	public MemberDto login(MemberDto reqMember) {
		MemberDto loginMember = memberdao.login(reqMember);
		return loginMember;
	}
	
	@Override
	public MemberDto selectOne(String email) {
		return memberdao.selectOne(email);

	}

	
}
