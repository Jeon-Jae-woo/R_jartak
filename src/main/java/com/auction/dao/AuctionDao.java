package com.auction.dao;

import java.util.List;

import com.auction.dto.AuctionDto;

public interface AuctionDao {
	String NAMESPACE = "auction.";
	
	//경매 등록
	public int InsertProduct(AuctionDto auctiondto);
	
	//경매 리스트
	public List<AuctionDto> selectProductList(int pageNum, int auctionType);
}
