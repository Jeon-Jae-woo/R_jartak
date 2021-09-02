package com.amount.dto;

import java.util.Date;

public class WithdrawalDto {
	private int withdrawal_no;
	private int account_no;
	private String nickname;
	private int amount;
	private String withdrawal_status;
	private Date created_at;
	private Date updated_at;
	public WithdrawalDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public WithdrawalDto(int withdrawal_no, int account_no, String nickname, int amount, String withdrawal_status,
			Date created_at, Date updated_at) {
		super();
		this.withdrawal_no = withdrawal_no;
		this.account_no = account_no;
		this.nickname = nickname;
		this.amount = amount;
		this.withdrawal_status = withdrawal_status;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}


	public int getWithdrawal_no() {
		return withdrawal_no;
	}
	public void setWithdrawal_no(int withdrawal_no) {
		this.withdrawal_no = withdrawal_no;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getWithdrawal_status() {
		return withdrawal_status;
	}
	public void setWithdrawal_status(String withdrawal_status) {
		this.withdrawal_status = withdrawal_status;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
	
}
