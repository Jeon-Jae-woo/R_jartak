package com.amount.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amount.dao.AmountDao;
import com.amount.dto.WithdrawalDto;
import com.util.pagingDto;

@Service
@Transactional
public class AmountBizImpl implements AmountBiz {

	@Autowired
	private AmountDao amountdao;
	@Autowired
	private pagingDto paging;
	
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
		int result = amountdao.WithdrawalProcessing(withInfo);
		return result;
	}

}
