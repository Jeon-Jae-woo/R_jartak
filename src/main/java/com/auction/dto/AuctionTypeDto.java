package com.auction.dto;

public class AuctionTypeDto {
	private int auction_type_no;
	private String auction_type_name;
	
	public AuctionTypeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AuctionTypeDto(int auction_type_no, String auction_type_name) {
		super();
		this.auction_type_no = auction_type_no;
		this.auction_type_name = auction_type_name;
	}

	public int getAuction_type_no() {
		return auction_type_no;
	}
	public void setAuction_type_no(int auction_type_no) {
		this.auction_type_no = auction_type_no;
	}
	public String getAuction_type_name() {
		return auction_type_name;
	}
	public void setAuction_type_name(String auction_type_name) {
		this.auction_type_name = auction_type_name;
	}
	
	
	
}
