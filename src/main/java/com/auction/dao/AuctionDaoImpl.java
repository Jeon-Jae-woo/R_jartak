package com.auction.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.auction.dto.AuctionDto;
import com.auction.dto.auction_interestedDto;

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
		return productDetail;
	}

	//경매 시간 종료(단일)
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

	@Override
	public int insertInterested(auction_interestedDto dto) {
		int res = sqlSession.insert(NAMESPACE+"insertInterested",dto);
		return res;
	}

	@Override
	public List<AuctionDto> selectInterestedList(int pageNum,String buy_nickname) {
		List<AuctionDto> productlist;
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("startRow",startRow);
		data.put("endRow",endRow);
		data.put("buy_nickname",buy_nickname);
		
		productlist = sqlSession.selectList(NAMESPACE+"interestedList",data);
		return productlist;
	}

	@Override
	public int interestedListCount() {
		int count = sqlSession.selectOne(NAMESPACE+"interestedlistCount");
		return count;
	}

	@Override
	public auction_interestedDto interestedListChk(int auction_no, String buy_nickname) {
		auction_interestedDto interestedInfo = new auction_interestedDto();
		interestedInfo.setInterested_auction_no(auction_no);
		interestedInfo.setBuy_nickname(buy_nickname);
		auction_interestedDto dto = sqlSession.selectOne(NAMESPACE+"interestedlistChk",interestedInfo);
		
		return dto;
	}
	
	public List<AuctionDto> MyProductList(Map<String,int[]> map){
		List<AuctionDto> Myproductlist= new ArrayList<AuctionDto>();
		try {
			Myproductlist = sqlSession.selectList(NAMESPACE+"MyproductList",map);
		} catch (Exception e) {
			System.out.println("Myproductlist에러!!@DaoImpl");
			e.printStackTrace();
		}
		return Myproductlist;
	}
	

}
