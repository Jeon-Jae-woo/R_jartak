package com.auction.dao;

import java.util.List;

import com.auction.dto.AuctionDto;

public interface AuctionDao {
	String NAMESPACE = "auction.";
	
	//경매 등록
	public int InsertProduct(AuctionDto auctiondto);
	
	//경매 리스트
	public List<AuctionDto> selectProductList(int pageNum, int auctionType);
	
	//경매 리스트 카운트
	public int productListCount(int auctionType);
	
	//경매 단일 조회
	public AuctionDto selectProductDetail(int auction_no);
	
	//경매 종료(단일)
	public int auctionTimeOver(int auction_no);

	//경매 종료 갱신(리스트)
	public int auctionTimeOverList();
	
	
	
	
}
