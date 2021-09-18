package com.bids.dto;

public class BidsDto {
	private int bid_no;
	private String nickname;
	private int auction_no;
	private int auction_status_no;
	private int bid_price;
	
	public BidsDto() {
		super();
	}
	public BidsDto(int bid_no, String nickname, int auction_no, int auction_status_no, int bid_price) {
		super();
		this.bid_no = bid_no;
		this.nickname = nickname;
		this.auction_no = auction_no;
		this.auction_status_no = auction_status_no;
		this.bid_price = bid_price;
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
	public int getAuction_status_no() {
		return auction_status_no;
	}
	public void setAuction_status_no(int auction_status_no) {
		this.auction_status_no = auction_status_no;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	
}
