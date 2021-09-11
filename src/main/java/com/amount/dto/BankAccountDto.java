package com.amount.dto;

public class BankAccountDto {
	private int account_no;
	private String nickname;
	private String bank_no;
	private String account_number;
	public BankAccountDto() {
		super();
	}
	public BankAccountDto(int account_no, String nickname, String bank_no, String account_number) {
		super();
		this.account_no = account_no;
		this.nickname = nickname;
		this.bank_no = bank_no;
		this.account_number = account_number;
	}
	public int getAccount_no() {
		return account_no;
	}
	public void setAccount_no(int account_no) {
		this.account_no = account_no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBank_no() {
		return bank_no;
	}
	public void setBank_no(String bank_no) {
		this.bank_no = bank_no;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	
	
	
}
