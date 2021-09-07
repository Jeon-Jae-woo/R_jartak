package com.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.member.dao.MemberDao;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;
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

	@Override
	public int insert(MemberDto dto) {
		return memberdao.insert(dto);

	public int updateInfo(MemberDto dto) {
		return memberdao.updateInfo(dto);
	}


	public MemberRankDto rank(int rank_no) {
		return memberdao.rank(rank_no);
	}

	@Override
	public int deleteInfo(String email) {
		return memberdao.deleteInfo(email);

	}

	
}
