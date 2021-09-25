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
	public int selectNo(int auction_no);
	
	//2. 거래진행
	public TradeDto selectOne(int auction_no);
	public int seller(String seller);
	public int bidder(String bidder);
	public int status(int auction_no);

	//경매 조회
	
	public List<TradeDto> tradeAuctionNoList_failBiz(String nickname);

	public List<TradeDto> SellertradeAuctionNoListBiz(String nickname);

	public List<TradeDto> SelltradeAuctionNoList_failBiz(String nickname);
}
