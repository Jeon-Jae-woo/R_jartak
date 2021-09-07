package com.auction.dto;

public class AuctionStatusDto {
	private int auction_status_no;
	private String auction_status_name;
	
	public AuctionStatusDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AuctionStatusDto(int auction_status_no, String auction_status_name) {
		super();
		this.auction_status_no = auction_status_no;
		this.auction_status_name = auction_status_name;
	}


	public int getAuction_status_no() {
		return auction_status_no;
	}
	public void setAuction_status_no(int auction_status_no) {
		this.auction_status_no = auction_status_no;
	}
	public String getAuction_status_name() {
		return auction_status_name;
	}
	public void setAuction_status_name(String auction_status_name) {
		this.auction_status_name = auction_status_name;
	}
	
	
	
}
