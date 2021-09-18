package com.trade.dto;

public class TradeDto {
	
	private int trade_no;
	private int trade_status_no;
	private int bid_no;
	private int auction_no;
	private String bidder_nickname;
	private String seller;
	private int final_bid_price;
	
	public TradeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradeDto(int trade_no, int trade_status_no, int bid_no, int auction_no, String bidder_nickname,
			String seller, int final_bid_price) {
		super();
		this.trade_no = trade_no;
		this.trade_status_no = trade_status_no;
		this.bid_no = bid_no;
		this.auction_no = auction_no;
		this.bidder_nickname = bidder_nickname;
		this.seller = seller;
		this.final_bid_price = final_bid_price;
	}
	
	//insert DTO
	public TradeDto(int bid_no, int auction_no, String bidder_nickname, String seller, int final_bid_price) {
		super();
		this.bid_no = bid_no;
		this.auction_no = auction_no;
		this.bidder_nickname = bidder_nickname;
		this.seller = seller;
		this.final_bid_price = final_bid_price;
	}

	public int getTrade_no() {
		return trade_no;
	}

	public void setTrade_no(int trade_no) {
		this.trade_no = trade_no;
	}

	public int getTrade_status_no() {
		return trade_status_no;
	}

	public void setTrade_status_no(int trade_status_no) {
		this.trade_status_no = trade_status_no;
	}

	public int getBid_no() {
		return bid_no;
	}

	public void setBid_no(int bid_no) {
		this.bid_no = bid_no;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getBidder_nickname() {
		return bidder_nickname;
	}

	public void setBidder_nickname(String bidder_nickname) {
		this.bidder_nickname = bidder_nickname;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public int getFinal_bid_price() {
		return final_bid_price;
	}

	public void setFinal_bid_price(int final_bid_price) {
		this.final_bid_price = final_bid_price;
	}
	
	
	
}
