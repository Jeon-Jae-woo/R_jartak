package com.member.dto;

import java.util.Date;

public class MemberDto {

	private String email;
	private String nickname;
	private String password;
	private String gender;
	private String name;
	private String birth;
	private Date created_at;
	private Date updated_at;
	private String address;
	private String address_detail;
	private int amount;
	private int tx_amount;
	private int level_no;
	private int status_no;
	private int rank_no;
	private String phone;
	
	//JOIN시에 활용
	private MemberStatusDto MemberStatus;
	private MemberLevelDto MemberLevel;
	private MemberRankDto MemberRankDto;
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(String email, String nickname, String password, String gender, String name, String birth,
			Date created_at, Date updated_at, String address, String address_detail, int amount, int tx_amount,
			int level_no, int status_no, int rank_no, MemberStatusDto memberStatus, MemberLevelDto memberLevel,
			com.member.dto.MemberRankDto memberRankDto, String phone) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.gender = gender;
		this.name = name;
		this.birth = birth;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.address = address;
		this.address_detail = address_detail;
		this.amount = amount;
		this.tx_amount = tx_amount;
		this.level_no = level_no;
		this.status_no = status_no;
		this.rank_no = rank_no;
		this.phone = phone;
		MemberStatus = memberStatus;
		MemberLevel = memberLevel;
		MemberRankDto = memberRankDto;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTx_amount() {
		return tx_amount;
	}

	public void setTx_amount(int tx_amount) {
		this.tx_amount = tx_amount;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public int getStatus_no() {
		return status_no;
	}

	public void setStatus_no(int status_no) {
		this.status_no = status_no;
	}

	public int getRank_no() {
		return rank_no;
	}

	public void setRank_no(int rank_no) {
		this.rank_no = rank_no;
	}

	public MemberStatusDto getMemberStatus() {
		return MemberStatus;
	}

	public void setMemberStatus(MemberStatusDto memberStatus) {
		MemberStatus = memberStatus;
	}

	public MemberLevelDto getMemberLevel() {
		return MemberLevel;
	}

	public void setMemberLevel(MemberLevelDto memberLevel) {
		MemberLevel = memberLevel;
	}

	public MemberRankDto getMemberRankDto() {
		return MemberRankDto;
	}

	public void setMemberRankDto(MemberRankDto memberRankDto) {
		MemberRankDto = memberRankDto;
	}
	
}
