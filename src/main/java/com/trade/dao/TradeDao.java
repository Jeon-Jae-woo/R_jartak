package com.trade.dao;

import java.util.List;

import com.trade.dto.TradeDto;
import com.trade.dto.TradeUpdateDto;

public interface TradeDao {
	String NAMESPACE = "trade.";
	
	//거래 등록(단일)
	public int InsertTrade(TradeDto tradedto);
	
	//거래 등록(리스트)
	public int InsertListTrade(List<TradeDto> bidderList);
	
	//거래 진행
	public TradeUpdateDto selectNo(int trade_no);
	
	//trade상태 업데이트
	public int updateStatus(int trade_no);
	
}
