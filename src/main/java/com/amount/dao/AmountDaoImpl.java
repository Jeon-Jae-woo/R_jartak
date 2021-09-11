package com.amount.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.amount.biz.AmountBiz;
import com.amount.dto.BankAccountDto;
import com.amount.dto.WithdrawalDto;

@Repository
public class AmountDaoImpl implements AmountDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//출금 요청 리스트
	@Override
	public List<WithdrawalDto> WithdrawalList(int pageNum) {
		List<WithdrawalDto> withList = new ArrayList<WithdrawalDto>();
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String,Integer> paging = new HashMap<String,Integer>();
		paging.put("startRow", startRow);
		paging.put("endRow", endRow);
		
		withList = sqlSession.selectList(NAMESPACE+"withdrawallist", paging);
		
		return withList;
	}

	//출금 요청 카운트
	@Override
	public int WithdrawalListCount() {
		int count = 0;
		count = sqlSession.selectOne(NAMESPACE+"withdrawalcount");
		return count;
	}

	//출금 요청 처리
	@Override
	public int WithdrawalProcessing(Map<String, Object> withInfo) {
		int result = 0;
		result = sqlSession.update(NAMESPACE+"withprocessing", withInfo);
		return result;
	}

	//마이페이지에서 쓰임
	@Override
	public String getBankNo(String bankName) {
		String res ="";
		try {
			res = sqlSession.selectOne(NAMESPACE+"getAccountNo",bankName);
		} catch (Exception e) {
			System.out.println("[error : ] getBankAcc @ amountdaoimpl");
			e.printStackTrace();
		}  
		return res;
	}

	//마이페이지에서 쓰임
	@Override
	public List<BankAccountDto> getAccountNo(String nickname) {
		List<BankAccountDto> list = null; 
		try {
			list= sqlSession.selectList(NAMESPACE+"getAccountNo",nickname);
		} catch (Exception e) {
			System.out.println("[error : ] getAccountNo @ Dao");
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public int insertWithdrawal(String[] str) {
		int res = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("withdrawal_amount", str[0]);
		map.put("account_no", str[1]);
		map.put("nickname", str[2]);
		System.out.println("withdrawal_amount="+map.get("withdrawal_amount"));
		System.out.println("account_no="+map.get("account_no"));
		System.out.println("nickname="+map.get("nickname"));
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertWithdrawal",map);
		} catch (Exception e) {
			System.out.println("[error : ] insertWithdrawal @ Dao");
			e.printStackTrace();
		}
		
		return res;
	}

}
