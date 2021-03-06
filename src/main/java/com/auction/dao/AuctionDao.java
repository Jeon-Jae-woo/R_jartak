package com.auction.dao;

import java.util.List;
import java.util.Map;

import com.auction.dto.AuctionDto;
import com.auction.dto.auction_interestedDto;
import com.trade.dto.TradeDto;

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
	//관심상품등록
	public int insertInterested(auction_interestedDto dto);
	//관심상품리스트
	public List<AuctionDto> selectInterestedList(int pageNum,String buy_nickname);
	//관심상품리스트카운트
	public int interestedListCount();
	//관심상품중복체크
	public auction_interestedDto interestedListChk(int auction_no,String nickname);
	//마이페이지의 구매관리-경매중
	public List<AuctionDto> MyProductList(Map<String,int[]> map);

	//거래 테이블에 등록될 정보 반환
	public List<TradeDto> AuctionHighBidderList();
	
	//마감 임박 -> 1시간 미만으로 남은것
	public List<AuctionDto> DeadlineProductList(int pageNum);
	//마감 임박 경매 카운트
	public int deadlineListCount();
	//인기 경매 -> 입찰 수 많은 순으로 정렬
	public List<AuctionDto> PopularProductList(int pageNum);
	//인기 경매 카운트
	public int PopularListCount();
	//옥션삭제
	public int deleteAuction(int auction_no);


	//마이페이지  판매목록
	public List<AuctionDto> MysaleList(String nickname);
	//마이페이지 판매목록-end
	public List<AuctionDto> MysalelistEnd(String nickname);

	//검색기능
	public List<AuctionDto> searchfor(int pageNum, String search, int category);
	
	
}
	
