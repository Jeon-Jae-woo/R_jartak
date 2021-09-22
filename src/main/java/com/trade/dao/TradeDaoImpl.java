package com.trade.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trade.dto.TradeDto;
import com.trade.dto.TradeUpdateDto;

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

	@Override
	public TradeUpdateDto selectNo(int trade_no) {
		System.out.println(trade_no);
		TradeUpdateDto dto = new TradeUpdateDto();
		
		dto = sqlSession.selectOne(NAMESPACE+"selectNo",trade_no);
		
		return dto;
	}

	@Override
	public int updateStatus(int trade_no) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"updateStatus",trade_no);
		} catch (Exception e) {
			System.out.println("[error] : updatestatus");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	

}
