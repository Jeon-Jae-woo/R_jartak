package com.amount.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.amount.dao.AmountDao;
import com.amount.dto.BankAccountDto;
import com.amount.dto.WithdrawalDto;
import com.member.dao.AdminMemberDao;
import com.util.pagingDto;

@Service
@Transactional
public class AmountBizImpl implements AmountBiz {

	@Autowired
	private AmountDao amountdao;
	@Autowired
	private pagingDto paging;
	@Autowired
	private AdminMemberDao admindao;
	
	//출금 요청 리스트
	@Override
	public List<WithdrawalDto> WithdrawalList(int pageNum) {
		List<WithdrawalDto> withList = amountdao.WithdrawalList(pageNum); 
		return withList;
	}

	//출금 요청 카운트
	@Override
	public pagingDto WithdrawalListCount(int pageNum) {
		paging.setPageNum(pageNum);
		int size = 0;
		size = amountdao.WithdrawalListCount();
		paging.setTotalCount(size);
		paging.pagination();
		return paging;
	}
	//출금 요청 처리
	@Override
	public int WithdrawalProcessing(Map<String, Object> withInfo) {
		String status = withInfo.get("status").toString();
		int result=0;
		if(status.equals("승인")) {
			//출금 요청 row를 담아서 가져옴
			//업데이트로 해당하는 닉네임 머니 - 시킴
			//출금 요청 승인으로 바꿈
			try {
				WithdrawalDto withDto = amountdao.withdrawalOne(withInfo);
				int memberUpdate = admindao.updateEmoney(withDto.getNickname(), withDto.getAmount());
				if(memberUpdate < 0) {
					throw new Exception("e머니 업데이트 에러");
				}
				result = amountdao.WithdrawalProcessing(withInfo);
				if(result < 0 ) {
					throw new Exception("상태 변경 에러");
				}
			}catch(Exception e) {
				TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
			}
		}else {
			result = amountdao.WithdrawalProcessing(withInfo);	
		}
		
		return result;
	}
	
	//마이페이지에서 쓰임
	@Override
	public String getBankNo(String bankName) {
		return amountdao.getBankNo(bankName);
	}

	//마이페이지에서 쓰임
	@Override
	public List<BankAccountDto> getAccountNo(String nickname) {
		return amountdao.getAccountNo(nickname);
	}

	@Override
	public int insertWithdrawal(String[] str) {
		return amountdao.insertWithdrawal(str);
	}

}
