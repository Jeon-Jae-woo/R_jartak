package com.bids.dao;

import java.util.List;

import com.bids.dto.BidsDto;

public interface BidsDao {
	
	String NAMESPACE = "bids.";
	
	//입찰 정보 조회
	public BidsDto BidsSelectOne(String nickname, int auction_no);
	//입찰 최초 등록
	public int BidsFirstRegister(String nickname, int auction_no, int bid_price);
	//입찰 업데이트
	public int BidsRegister(String nickname, int auction_no, int bid_price);
	//회원 돈 업데이트
	public int MinusMemberAmountUpdate(String nickname, int bid_price);
	//회원 돈 업데이트
	public int PlusMemberAmountUpdate(String nickname, int bid_price);
	//경매 현재가격 및 최고 입찰자 업데이트
	public int AuctionCurrentUpdate(int auction_no, int current_price, String nickname);
	
	//마이페이지 구매이력에서쓰임
	public List<BidsDto> bidList(String nickname);

	
	
}
