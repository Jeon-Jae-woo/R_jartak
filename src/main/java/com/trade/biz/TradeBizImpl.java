package com.trade.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trade.dao.TradeDao;
import com.trade.dto.TradeDto;

@Service
public class TradeBizImpl implements TradeBiz {
	@Autowired
	private TradeDao tradeDao;
	
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

	@Override
	public List<TradeDto> SellertradeAuctionNoListBiz(String nickname) {
		return tradeDao.SellertradeAuctionNoList(nickname);
	}

	@Override
	public List<TradeDto> SelltradeAuctionNoList_failBiz(String nickname) {
		return tradeDao.SelltradeAuctionNoList_fail(nickname);
	}
	
}
