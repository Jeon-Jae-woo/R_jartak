package com.trade.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.dao.MemberDao;
import com.trade.dao.TradeDao;
import com.trade.dto.TradeUpdateDto;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.trade.dto.TradeDto;


@Service
public class TradeBizImpl implements TradeBiz {
	@Autowired
	private TradeDao tradeDao;

	@Autowired
	private MemberDao memberDao;

	
	@Override
	public void tradeupdateBiz(int trade_no) {
		
		// 1. trade와 seller,bidder의 정보를 가져온다.
		
		TradeUpdateDto tradeUpdate = tradeDao.selectNo(trade_no);
		
		int sellerMoney = tradeUpdate.getSellerMoney();
		int bidderMoney = tradeUpdate.getBidderMoney();
		int final_bid_price = tradeUpdate.getFinal_bid_price();
	
		
		// 2. 트레이드 금액으로 sellerMoney, bidderMoney 연산을 해준다.
		sellerMoney = sellerMoney + final_bid_price;
		bidderMoney = bidderMoney - final_bid_price;
	
		// 3. seller의 보유 금액을 업데이트 해준다.
		memberDao.updateAmount(tradeUpdate.getSellerName(),sellerMoney);
		
		// 4. bidder의 보유 금액을 업데이트 해준다.
		memberDao.updateAmount(tradeUpdate.getBidderName(),bidderMoney);
		
		// 5. trade의 상태를 업데이트를 해준다.
		
		tradeDao.updateStatus(trade_no);
		
		
		
		
		
		

	
	@Override
	public List<TradeDto> tradeListBiz(Map<String, int[]> map) {
		return tradeDao.tradeList(map);
	}

	@Override
	public List<TradeDto> tradeListChkBiz(Map<String,Object> map) {
		return tradeDao.tradeListChk(map);
	}

	@Override
	public List<TradeDto> tradeAuctionNoListBiz(String nickname) {
		return tradeDao.tradeAuctionNoList(nickname);
	}

	@Override
	public List<TradeDto> tradeAuctionNoList_failBiz(String nickname) {
		// TODO Auto-generated method stub
		return tradeDao.tradeAuctionNoList_fail(nickname);

	}
	
}
