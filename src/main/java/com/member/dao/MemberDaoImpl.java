package com.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amount.dto.BankAccountDto;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;
import com.trade.dto.TradeUpdateDto;

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

	@Override
	public int deleteInfo(String email) {
		int res = 0;
		System.out.println("[email]:"+email);
		try {
			res = sqlSession.delete(MYPAGE_NAMESPACE+"deleteInfo", email);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public MemberDto selectOneNick(String nickname) {
		MemberDto dto = sqlSession.selectOne(MEMBER_NAMESAPCE+"selectOneNick", nickname);
		return dto;
	}


	public int updateInfo_Emoney(MemberDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(MYPAGE_NAMESPACE+"updateInfoEmoney",dto);
		} catch (Exception e) {
			System.out.println("[error:updateInfo_Emoney] @dao ");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertBank(BankAccountDto bankacc) {
		int res = 0;
		res = sqlSession.insert(MYPAGE_NAMESPACE+"insertBank",bankacc);
		return res;
	}

	@Override
	public int updateAmount(String nickName, int amount) {
		System.out.println(nickName);
		System.out.println(amount);
		int res = 0;
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("nickname", nickName);
		data.put("amount", amount);
		
		
		try {
			res = sqlSession.update(MEMBER_NAMESAPCE+"updateAmount",data);
		} catch (Exception e) {
			System.out.println("[error:tradeupdate] @dao ");
			e.printStackTrace();
		}
		
		return res;
	}


}
