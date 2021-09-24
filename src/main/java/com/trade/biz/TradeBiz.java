package com.trade.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.trade.dto.TradeDto;

public interface TradeBiz {
	public List<TradeDto> tradeListBiz(Map<String,int[]> map);
	
	public List<TradeDto> tradeListChkBiz(Map<String,Object> map);
	
	public List<TradeDto> tradeAuctionNoListBiz(String nickname);

	public List<TradeDto> tradeAuctionNoList_failBiz(String nickname);

	public List<TradeDto> SellertradeAuctionNoListBiz(String nickname);

	public List<TradeDto> SelltradeAuctionNoList_failBiz(String nickname);
}
