package com.auction.biz;

import java.util.List;
import java.util.Map;

import com.auction.dto.AuctionDto;
import com.util.pagingDto;

public interface AuctionBiz {
	
	//경매 등록
	public int insertProductBiz(AuctionDto auctiondto);
	//경매 리스트
	public List<AuctionDto> selectProductListBiz(int pageNum, int auctionType);
	//경매 리스트 카운트
	public pagingDto productListCountBiz(int pageNum, int auctionType);
	//경매 단일 조회
	public AuctionDto productDetailBiz(int auction_no);
	//경매 종료 리스트 갱신
	public int TimeOutListBiz();
	//경매 종료(단일)
	public int TimeOutBiz(Map<String,Object> data);

}
