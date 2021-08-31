package com.member.dto;

public class MemberRankDto {
	private int rank_no;
	private String rank_name;
	private String rating_amount;
	
	public MemberRankDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberRankDto(int rank_no, String rank_name, String rating_amount) {
		super();
		this.rank_no = rank_no;
		this.rank_name = rank_name;
		this.rating_amount = rating_amount;
	}

	public int getRank_no() {
		return rank_no;
	}
	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}
	public String getRank_name() {
		return rank_name;
	}
	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}
	public String getRating_amount() {
		return rating_amount;
	}
	public void setRating_amount(String rating_amount) {
		this.rating_amount = rating_amount;
	}
	
	
	
	
	
}
