package com.trade.dto;

public class TradeUpdateDto {
	
	private int trade_no;
	private int trade_status_no;
	private int final_bid_price;
	private int auction_no;
	private String seller;
	private int seller_amount;
	private String bidder_nickname;
	private int bidder_amount;
	
	public TradeUpdateDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradeUpdateDto(int trade_no, int trade_status_no, int final_bid_price, int auction_no, String seller,
			int seller_amount, String bidder_nickname, int bidder_amount) {
		super();
		this.trade_no = trade_no;
		this.trade_status_no = trade_status_no;
		this.final_bid_price = final_bid_price;
		this.auction_no = auction_no;
		this.seller = seller;
		this.seller_amount = seller_amount;
		this.bidder_nickname = bidder_nickname;
		this.bidder_amount = bidder_amount;
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

	public int getFinal_bid_price() {
		return final_bid_price;
	}

	public void setFinal_bid_price(int final_bid_price) {
		this.final_bid_price = final_bid_price;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public int getSeller_amount() {
		return seller_amount;
	}

	public void setSeller_amount(int seller_amount) {
		this.seller_amount = seller_amount;
	}

	public String getBidder_nickname() {
		return bidder_nickname;
	}

	public void setBidder_nickname(String bidder_nickname) {
		this.bidder_nickname = bidder_nickname;
	}

	public int getBidder_amount() {
		return bidder_amount;
	}

	public void setBidder_amount(int bidder_amount) {
		this.bidder_amount = bidder_amount;
	}


	
	
}
