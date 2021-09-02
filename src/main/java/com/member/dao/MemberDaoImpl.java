package com.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

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

	@Override
	public int updateInfo(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(MYPAGE_NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		
		return res;
	}
	public MemberRankDto rank(int rank_no) {
		System.out.println("등급확인");
		MemberRankDto dto = new MemberRankDto();
		try {
			dto = sqlSession.selectOne(MEMBER_NAMESAPCE+"grade",rank_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
		
	//회원 상태 변경
	@Override
	public int ChangeStatus(String nickname, int status_no) {
		int result = 0;
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("nickname", nickname);
		data.put("status_no", status_no);
		result = sqlSession.update(MEMBER_NAMESAPCE+"changestatus", data);
		return result;
	}

}
