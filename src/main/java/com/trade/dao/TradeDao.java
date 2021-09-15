package com.trade.dao;

import com.trade.dto.TradeDto;

public interface TradeDao {
	String NAMESPACE = "trade.";
	
	//거래 등록
	public int InsertTrade(TradeDto tradedto);
	
}
