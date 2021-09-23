package com.bids.dto;


import java.util.Date;

public class BidsDto {
	
	private int bid_no;
	private String nickname;
	private int auction_no;
	private int bid_price;
	private Date bidding_time;
	
	public BidsDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BidsDto(int bid_no, String nickname, int auction_no, int bid_price,
			Date bidding_time) {
		super();
		this.bid_no = bid_no;
		this.nickname = nickname;
		this.auction_no = auction_no;
		this.bid_price = bid_price;
		this.bidding_time = bidding_time;
	}
	public int getBid_no() {
		return bid_no;
	}
	public void setBid_no(int bid_no) {
		this.bid_no = bid_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAuction_no() {
		return auction_no;
	}
	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}

	public Date getBidding_time() {
		return bidding_time;
	}
	public void setBidding_time(Date bidding_time) {
		this.bidding_time = bidding_time;
	}
	
	
	
	
	
}
