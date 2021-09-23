package com.trade.dto;

public class TradeUpdateDto {
	
	private int trade_no;
	private int trade_status_no;
	private int final_bid_price;
	private String sellerName;
	private int sellerMoney;
	private String bidderName;
	private int bidderMoney;
	
	public TradeUpdateDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradeUpdateDto(int trade_no, int trade_status_no, int final_bid_price, String sellerName, int sellerMoney,
			String bidderName, int bidderMoney) {
		super();
		this.trade_no = trade_no;
		this.trade_status_no = trade_status_no;
		this.final_bid_price = final_bid_price;
		this.sellerName = sellerName;
		this.sellerMoney = sellerMoney;
		this.bidderName = bidderName;
		this.bidderMoney = bidderMoney;
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

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public int getSellerMoney() {
		return sellerMoney;
	}

	public void setSellerMoney(int sellerMoney) {
		this.sellerMoney = sellerMoney;
	}

	public String getBidderName() {
		return bidderName;
	}

	public void setBidderName(String bidderName) {
		this.bidderName = bidderName;
	}

	public int getBidderMoney() {
		return bidderMoney;
	}

	public void setBidderMoney(int bidderMoney) {
		this.bidderMoney = bidderMoney;
	}
	
	
	

	
	
}
