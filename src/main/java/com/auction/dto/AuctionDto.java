package com.auction.dto;

import java.time.LocalDateTime;

public class AuctionDto {
	private int auction_no;
	private int auction_type_no;
	private String nickname;
	private int auction_status_no;
	private String product_name;
	private String auction_title;
	private String auction_content;
	private int product_price;
	private int bidding_unit;
	private LocalDateTime endDate;
	private LocalDateTime created_at;
	private int auction_hits;
	//종료날짜 필드(리스트 전용)
	private String remainingTime;
	//종료날짜 필드(디테일 전용, 초로 계산해서 보내줌)
	private int remainingSeconds;
	//종료 날짜 String
	private String endDateStr;
	//시작 날짜 String
	private String createDateStr;
	//이미지
	private String product_img;
	//현재 가격
	private int current_price;

	private String high_bidder;
	
	
	//JOIN시에 활용
	private AuctionStatusDto auctionStatus;
	private AuctionTypeDto auctionType;
	
	public AuctionDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuctionDto(int auction_no, int auction_type_no, String nickname, int auction_status_no, String product_name,
			String auction_title, String auction_content, int product_price, int bidding_unit, LocalDateTime endDate,
			LocalDateTime created_at, int auction_hits, String remainingTime, int remainingSeconds, String endDateStr,
			String product_img, AuctionStatusDto auctionStatus, AuctionTypeDto auctionType, String createDateStr, int current_price, String high_bidder) {
		super();
		this.auction_no = auction_no;
		this.auction_type_no = auction_type_no;
		this.nickname = nickname;
		this.auction_status_no = auction_status_no;
		this.product_name = product_name;
		this.auction_title = auction_title;
		this.auction_content = auction_content;
		this.product_price = product_price;
		this.bidding_unit = bidding_unit;
		this.endDate = endDate;
		this.created_at = created_at;
		this.auction_hits = auction_hits;
		this.remainingTime = remainingTime;
		this.remainingSeconds = remainingSeconds;
		this.endDateStr = endDateStr;
		this.product_img = product_img;
		this.auctionStatus = auctionStatus;
		this.auctionType = auctionType;
		this.createDateStr = createDateStr;
		this.current_price = current_price;
		this.high_bidder = high_bidder;
	}

	public String getHigh_bidder() {
		return high_bidder;
	}

	public void setHigh_bidder(String high_bidder) {
		this.high_bidder = high_bidder;
	}

	public int getCurrent_price() {
		return current_price;
	}

	public void setCurrent_price(int current_price) {
		this.current_price = current_price;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public int getAuction_type_no() {
		return auction_type_no;
	}

	public void setAuction_type_no(int auction_type_no) {
		this.auction_type_no = auction_type_no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAuction_status_no() {
		return auction_status_no;
	}

	public void setAuction_status_no(int auction_status_no) {
		this.auction_status_no = auction_status_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getAuction_title() {
		return auction_title;
	}

	public void setAuction_title(String auction_title) {
		this.auction_title = auction_title;
	}

	public String getAuction_content() {
		return auction_content;
	}

	public void setAuction_content(String auction_content) {
		this.auction_content = auction_content;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getBidding_unit() {
		return bidding_unit;
	}

	public void setBidding_unit(int bidding_unit) {
		this.bidding_unit = bidding_unit;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public LocalDateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}

	public int getAuction_hits() {
		return auction_hits;
	}

	public void setAuction_hits(int auction_hits) {
		this.auction_hits = auction_hits;
	}

	public String getRemainingTime() {
		return remainingTime;
	}

	public void setRemainingTime(String remainingTime) {
		this.remainingTime = remainingTime;
	}

	public int getRemainingSeconds() {
		return remainingSeconds;
	}

	public void setRemainingSeconds(int remainingSeconds) {
		this.remainingSeconds = remainingSeconds;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public AuctionStatusDto getAuctionStatus() {
		return auctionStatus;
	}

	public void setAuctionStatus(AuctionStatusDto auctionStatus) {
		this.auctionStatus = auctionStatus;
	}

	public AuctionTypeDto getAuctionType() {
		return auctionType;
	}

	public void setAuctionType(AuctionTypeDto auctionType) {
		this.auctionType = auctionType;
	}
	
	
	
}
