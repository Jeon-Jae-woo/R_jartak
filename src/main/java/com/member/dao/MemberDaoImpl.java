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
	
	@Override
	public MemberDto selectOne(String email) {
		System.out.println(email);
		MemberDto dto = new MemberDto();
		try {
			dto =  sqlSession.selectOne(NAMESPACE2+"selectOne",email);
			System.out.println(dto.getEmail());
		} catch (Exception e) {
			System.out.println("[error] : selectOne ");
			e.printStackTrace();
		}
		
		return dto;

	}

}
