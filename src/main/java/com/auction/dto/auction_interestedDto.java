package com.auction.dto;

public class auction_interestedDto {
	private int interested_auction_no;  
	private String sell_nickname;
	private String buy_nickname;
	public auction_interestedDto() {
		super();
	}
	public auction_interestedDto(int interested_auction_no, String sell_nickname, String buy_nickname) {
		super();
		this.interested_auction_no = interested_auction_no;
		this.sell_nickname = sell_nickname;
		this.buy_nickname = buy_nickname;
	}
	public int getInterested_auction_no() {
		return interested_auction_no;
	}
	public void setInterested_auction_no(int interested_auction_no) {
		this.interested_auction_no = interested_auction_no;
	}
	public String getSell_nickname() {
		return sell_nickname;
	}
	public void setSell_nickname(String sell_nickname) {
		this.sell_nickname = sell_nickname;
	}
	public String getBuy_nickname() {
		return buy_nickname;
	}
	public void setBuy_nickname(String buy_nickname) {
		this.buy_nickname = buy_nickname;
	}
	
	
}
