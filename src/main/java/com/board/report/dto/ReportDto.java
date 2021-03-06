package com.board.report.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class ReportDto {
	private int report_no;
	private String nickname;
	private String target_nickname;
	private String report_type;
	private String report_content;
	private LocalDateTime created_at;
	private LocalDateTime updated_at;
	private String report_title;
	
	private LocalDate createdLocalDate;
	
	public ReportDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportDto(int report_no, String nickname, String target_nickname, String report_type, String report_content,
			LocalDateTime created_at, LocalDateTime updated_at, String report_title, LocalDate createdLocalDate) {
		super();
		this.report_no = report_no;
		this.nickname = nickname;
		this.target_nickname = target_nickname;
		this.report_type = report_type;
		this.report_content = report_content;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.report_title = report_title;
		this.createdLocalDate = createdLocalDate;
	}


	public LocalDate getCreatedLocalDate() {
		return createdLocalDate;
	}

	public void setCreatedLocalDate(LocalDate createdLocalDate) {
		this.createdLocalDate = createdLocalDate;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTarget_nickname() {
		return target_nickname;
	}

	public void setTarget_nickname(String target_nickname) {
		this.target_nickname = target_nickname;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public LocalDateTime getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDateTime created_at) {
		this.created_at = created_at;
	}

	public LocalDateTime getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	
}
