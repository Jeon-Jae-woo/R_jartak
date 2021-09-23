package com.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.dto.AuctionDto;
import com.trade.dto.TradeDto;

@Repository
public class AuctionDaoImpl implements AuctionDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//경매 등록
	@Override
	public int InsertProduct(AuctionDto auctiondto) {
		int result = sqlSession.insert(NAMESPACE+"insertProduct", auctiondto);
		return result;
	}
	
	//경매 리스트
	@Override
	public List<AuctionDto> selectProductList(int pageNum, int auctionType) {
		List<AuctionDto> productlist;
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("auctionType", auctionType);
		data.put("startRow", startRow);
		data.put("endRow", endRow);
		
		productlist = sqlSession.selectList(NAMESPACE+"productList", data);
		
		return productlist;
	}

	//경매 단일 조회
	@Override
	public AuctionDto selectProductDetail(int auction_no) {
		AuctionDto productDetail = sqlSession.selectOne(NAMESPACE+"productDetail", auction_no);
		if(productDetail.getHigh_bidder() == null) {
			productDetail.setHigh_bidder("입찰자가 없습니다");
		}
		return productDetail;
	}

	//경매 시간 종료 및 체크(단일)
	@Override
	public int auctionTimeOver(int auction_no) {
		int result = sqlSession.update(NAMESPACE+"timeOver", auction_no);
		return result;
	}

	//경매 시간 종료(리스트)
	@Override
	public int auctionTimeOverList() {
		int result = 0;
		result = sqlSession.update(NAMESPACE+"timeOverList");	
		
		return result;
	}

	//경매 리스트 카운트
	@Override
	public int productListCount(int auctionType) {
		int count = sqlSession.selectOne(NAMESPACE+"porductlistCount", auctionType);
		return count;
	}

	//거래 테이블에 등록될 정보 반환
	@Override
	public List<TradeDto> AuctionHighBidderList() {
		List<TradeDto> bidderList = sqlSession.selectList(NAMESPACE+"auctionListTrade");
		return bidderList;
	}

	//마감 임박 경매 리스트 -> 1시간 이하로 남은 경매
	@Override
	public List<AuctionDto> DeadlineProductList(int pageNum) {
		List<AuctionDto> productlist;
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("startRow", startRow);
		data.put("endRow", endRow);
		
		productlist = sqlSession.selectList(NAMESPACE+"deadlineProductList", data);
		
		return productlist;
	}
	//마감 임박 경매 리스트 카운트
	@Override
	public int deadlineListCount() {
		int count = sqlSession.selectOne(NAMESPACE+"deadlinePorductCount");
		return count;
	}

	//인기 경매 리스트
	@Override
	public List<AuctionDto> PopularProductList(int pageNum) {
		List<AuctionDto> productlist;
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("startRow", startRow);
		data.put("endRow", endRow);
		
		productlist = sqlSession.selectList(NAMESPACE+"popularProductList", data);
		
		return productlist;
	}

	//인기 경매 카운트
	@Override
	public int PopularListCount() {
		int count = sqlSession.selectOne(NAMESPACE+"popularProductCount");
		return count;
	}
	
	
	

}
