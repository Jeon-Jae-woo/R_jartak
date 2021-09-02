package com.amount.biz;

import java.util.List;
import java.util.Map;

import com.amount.dto.WithdrawalDto;
import com.util.pagingDto;

public interface AmountBiz {
	//출금 신청 리스트
	public List<WithdrawalDto> WithdrawalList(int pageNum);
	//출금 신청 카운트
	public pagingDto WithdrawalListCount(int pageNum);
	//출금 신청 처리
	public int WithdrawalProcessing(Map<String, Object> withInfo);
	
}
