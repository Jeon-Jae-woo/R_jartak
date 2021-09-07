package com.auction.biz;

import java.util.List;

import com.auction.dto.AuctionDto;

public interface AuctionBiz {
	
	//경매 등록
	public int insertProductBiz(AuctionDto auctiondto);
	//경매 리스트
	public List<AuctionDto> selectProductListBiz(int pageNum, int auctionType);
}
