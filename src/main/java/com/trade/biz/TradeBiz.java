package com.trade.biz;


import com.trade.dto.TradeUpdateDto;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.trade.dto.TradeDto;


public interface TradeBiz {
	public List<TradeDto> tradeListBiz(Map<String,int[]> map);
	
	public List<TradeDto> tradeListChkBiz(Map<String,Object> map);
	
	public List<TradeDto> tradeAuctionNoListBiz(String nickname);

  //거래진행
  public void tradeupdateBiz(int trade_no);

	//경매 조회
	
	public List<TradeDto> tradeAuctionNoList_failBiz(String nickname);

}
