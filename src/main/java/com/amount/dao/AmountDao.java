package com.amount.dao;

import java.util.List;
import java.util.Map;

import com.amount.dto.WithdrawalDto;

public interface AmountDao {
	String NAMESPACE = "amount.";
	
	//출금 요청 리스트
	public List<WithdrawalDto> WithdrawalList(int pageNum);
	//출금 요청 카운트
	public int WithdrawalListCount();
	//출금 요청 처리
	public int WithdrawalProcessing(Map<String, Object> withInfo);
	
}
