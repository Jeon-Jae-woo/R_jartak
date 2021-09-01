package com.amount.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
