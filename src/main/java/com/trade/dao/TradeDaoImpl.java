package com.trade.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trade.dto.TradeDto;

@Repository
public class TradeDaoImpl implements TradeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//거래 등록
	@Override
	public int InsertTrade(TradeDto tradedto) {
		int result = sqlSession.insert(NAMESPACE+"tradeInsert", tradedto);
		return result;
	}

	//거래 등록 리스트
	@Override
	public int InsertListTrade(List<TradeDto> bidderList) {
		//TRADE_NO, TRADE_STATUS_NO, BID_NO, AUCTION_NO, BIDDER_NICKNAME, SELLER, FINAL_BID_PRICE
		int result = sqlSession.update(NAMESPACE+"tradeInsertList", bidderList);
		
		if(result != bidderList.size()) {
			result = -1;
		}
		return result;
	}
	
	//마이페이지에서 구매-거래종료에서 낙찰ㄹ가 가져오기 위한
	@Override
	public List<TradeDto> tradeList(Map<String, int[]> map) {
		List<TradeDto> list = null;
		try {
			list = sqlSession.selectList(NAMESPACE+"tradeList",map);
		} catch (Exception e) {
			System.out.println("tradelist@dao에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TradeDto> tradeListChk(Map<String,Object> map) {

		List<TradeDto> list = null;
		list = sqlSession.selectList(NAMESPACE+"tradeListChk",map);
		
		
		return list;
	}

	@Override
	public List<TradeDto> tradeAuctionNoList(String nickname) {
		List<TradeDto> list = null;
		list = sqlSession.selectList(NAMESPACE+"tradeAuctionNoList",nickname);
		return list;
	}

	@Override
	public List<TradeDto> tradeAuctionNoList_fail(String nickname) {
		List<TradeDto> list = null;
		list = sqlSession.selectList(NAMESPACE+"tradeAuctionNoList_fail",nickname);
		return list;
	}

	@Override
	public List<TradeDto> SellertradeAuctionNoList(String nickname) {
		List<TradeDto> list = null;
		list = sqlSession.selectList(NAMESPACE+"SellertradeAuctionNoList",nickname);
		return list;
	}

	@Override
	public List<TradeDto> SelltradeAuctionNoList_fail(String nickname) {
		List<TradeDto> list = null;
		list = sqlSession.selectList(NAMESPACE+"SelltradeAuctionNoList_fail",nickname);
		return list;
	}

}
