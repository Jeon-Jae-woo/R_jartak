package com.bids.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bids.dto.BidsDto;


@Repository
public class BidsDaoImpl implements BidsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	//입찰 정보 조회
	@Override
	public BidsDto BidsSelectOne(String nickname, int auction_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("nickname", nickname);
		param.put("auction_no", auction_no);
		BidsDto bidsDetail = sqlSession.selectOne(NAMESPACE+"selectOne", param);
		
		return bidsDetail;
	}	
	
	//입찰 최초 등록
	@Override
	public int BidsFirstRegister(String nickname, int auction_no, int bid_price) {
		Map<String, Object> bidsData = new HashMap<String, Object>();
		bidsData.put("nickname", nickname);
		bidsData.put("auction_no", auction_no);
		bidsData.put("bid_price", bid_price);
		
		int result = sqlSession.insert(NAMESPACE+"firstInsert", bidsData);
		return result;
	}

	//입찰 업데이트
	@Override
	public int BidsRegister(String nickname, int auction_no, int bid_price) {
		Map<String, Object> bidsData = new HashMap<String, Object>();
		bidsData.put("nickname", nickname);
		bidsData.put("auction_no", auction_no);
		bidsData.put("bid_price", bid_price);
		
		int result = sqlSession.update(NAMESPACE+"updateBids", bidsData);
		return result;
	}

	//회원 금액 업데이트(입찰자)
	@Override
	public int MinusMemberAmountUpdate(String nickname, int bid_price) {
		Map<String, Object> memberData = new HashMap<String, Object>();
		memberData.put("nickname", nickname);
		memberData.put("bid_price", bid_price);
		
		int result = sqlSession.update(NAMESPACE+"minusUpdateAmount", memberData);
		
		return result;
	}
	//회원 금액 업데이트(최고 입찰자)
	@Override
	public int PlusMemberAmountUpdate(String nickname, int bid_price) {
		Map<String, Object> memberData = new HashMap<String, Object>();
		memberData.put("nickname", nickname);
		memberData.put("bid_price", bid_price);
		
		int result = sqlSession.update(NAMESPACE+"plusUpdateAmount", memberData);
		return result;
	}

	//경매 현재가격 및 최고 입찰자 업데이트
	@Override
	public int AuctionCurrentUpdate(int auction_no, int current_price, String nickname) {
		Map<String, Object> auctionData = new HashMap<String, Object>();
		auctionData.put("auction_no", auction_no);
		auctionData.put("current_price", current_price);
		auctionData.put("nickname", nickname);
		
		int result = sqlSession.update(NAMESPACE+"auctionUpdate", auctionData);
		
		return result;
	}

	@Override
	public List<BidsDto> bidList(String nickname) {
		List<BidsDto> bidList = new ArrayList<BidsDto>();
		try {
			bidList = sqlSession.selectList(NAMESPACE+"selectList",nickname);
		} catch (Exception e) {
			System.out.println("BidDto불러오기 실패...");
			e.printStackTrace();
		}
		return bidList;
	}


	
}
