package com.member.dto;

public class MemberStatusDto {
	private int status_no;
	private String status_name;
	
	public MemberStatusDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberStatusDto(int status_no, String status_name) {
		super();
		this.status_no = status_no;
		this.status_name = status_name;
	}

	public int getStatus_no() {
		return status_no;
	}
	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}
	public String getStatus_name() {
		return status_name;
	}
	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	
	
}
