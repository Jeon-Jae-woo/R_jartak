package com.amount.dao;

import java.util.List;
import java.util.Map;

import com.amount.biz.AmountBiz;
import com.amount.dto.BankAccountDto;
import com.amount.dto.WithdrawalDto;

public interface AmountDao {
	String NAMESPACE = "amount.";
	
	//출금 요청 리스트
	public List<WithdrawalDto> WithdrawalList(int pageNum);
	//출금 요청 카운트
	public int WithdrawalListCount();
	//출금 요청 처리
	public int WithdrawalProcessing(Map<String, Object> withInfo);
	
	//마이페이지에서 쓰임
	//은행코드
	public String getBankNo(String bankname);
	//마이페이지에서 쓰임
	//계좌번호
	public List<BankAccountDto> getAccountNo(String nickname);
	//마이페이지에서의 출금신청
	public int insertWithdrawal(String[] str);
}
