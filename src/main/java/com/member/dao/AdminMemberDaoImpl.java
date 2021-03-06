package com.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.member.dto.MemberDto;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원 목록
	@Override
	public List<MemberDto> memberList(int pageNum) {
		List<MemberDto> userlist = new ArrayList<MemberDto>();
		
		Map<String,Integer> paging = new HashMap<String, Integer>();
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		paging.put("startRow", startRow);
		paging.put("endRow", endRow);
		
		userlist = sqlSession.selectList(NAMESPACE+"memberlist", paging);
			
		return userlist;
	}
	
	//회원 목록 페이징
	@Override
	public int memberListCount() {
		int count = 0;
		count = sqlSession.selectOne(NAMESPACE+"memberlistCount");
		return count;
	}

	//회원 상태 변경
	@Override
	public int changeStatus(String email, int status) {
		int result = 0;
		Map<String,Object> changeMap = new HashMap<String, Object>();
		changeMap.put("email", email);
		changeMap.put("status", status);
		result = sqlSession.update(NAMESPACE+"changeStatus", changeMap);
		return result;
	}

	@Override
	public int updateEmoney(String nickname, int requestAmount) {
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("nickname", nickname);
		data.put("requestAmount", requestAmount);
		int result = sqlSession.update(NAMESPACE+"withProcess", data);
		System.out.println("돈처리");
		return result;
	}

}
