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
		
		loginMember = sqlSession.selectOne(MEMBER_NAMESAPCE+"login", reqMember);
		
		return loginMember;

	}
	
	@Override
	public MemberDto selectOne(String email) {
		System.out.println(email);
		MemberDto dto = new MemberDto();
		try {
			dto =  sqlSession.selectOne(MYPAGE_NAMESPACE+"selectOne",email);
		} catch (Exception e) {
			System.out.println("[error] : selectOne ");
			e.printStackTrace();
		}
		
		return dto;

	}
	
	//회원가입
	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		
		try {
			res= sqlSession.insert(MEMBER_NAMESAPCE+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	

}
