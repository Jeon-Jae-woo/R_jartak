package com.auction.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.dto.AuctionDto;

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
		//수정에 성공한 result count 체크
		
		return result;
	}

	//경매 리스트 카운트
	@Override
	public int productListCount(int auctionType) {
		int count = sqlSession.selectOne(NAMESPACE+"porductlistCount", auctionType);
		return count;
	}

	
	

}
