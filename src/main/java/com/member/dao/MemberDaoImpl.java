package com.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(MemberDto reqMember) {
		MemberDto loginMember = null;
		
		loginMember = sqlSession.selectOne(NAMESAPCE+"login", reqMember);
		
		return loginMember;
	}

}
