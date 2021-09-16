package com.trade.dao;

import java.util.List;

import com.trade.dto.TradeDto;

public interface TradeDao {
	String NAMESPACE = "trade.";
	
	//거래 등록(단일)
	public int InsertTrade(TradeDto tradedto);
	
	//거래 등록(리스트)
	public int InsertListTrade(List<TradeDto> bidderList);
	
}
