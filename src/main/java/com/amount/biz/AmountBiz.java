package com.amount.biz;

import java.util.List;
import java.util.Map;

import com.amount.dto.BankAccountDto;
import com.amount.dto.WithdrawalDto;
import com.util.pagingDto;

public interface AmountBiz {
	//출금 신청 리스트
	public List<WithdrawalDto> WithdrawalList(int pageNum);
	//출금 신청 카운트
	public pagingDto WithdrawalListCount(int pageNum);
	//출금 신청 처리
	public int WithdrawalProcessing(Map<String, Object> withInfo);
	//은행코드
	public String getBankNo(String bankName);
	//계좌번호
	public List<BankAccountDto> getAccountNo(String nickname);
	//마이페이지-출금신청등록
	public int insertWithdrawal(String[] str);
}
