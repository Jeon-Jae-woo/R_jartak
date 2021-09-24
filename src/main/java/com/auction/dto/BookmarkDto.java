package com.auction.dto;

public class BookmarkDto {
	private int bookmark_no;
	private int auction_no;
	private String nickname;

	public BookmarkDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookmarkDto(int bookmark_no, int auction_no, String nickname) {
		super();
		this.bookmark_no = bookmark_no;
		this.auction_no = auction_no;
		this.nickname = nickname;
	}

	public int getBookmark_no() {
		return bookmark_no;
	}

	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}

	public int getAuction_no() {
		return auction_no;
	}

	public void setAuction_no(int auction_no) {
		this.auction_no = auction_no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
