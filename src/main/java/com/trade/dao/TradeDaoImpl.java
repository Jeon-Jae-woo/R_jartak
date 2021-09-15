package com.trade.dao;

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

}
