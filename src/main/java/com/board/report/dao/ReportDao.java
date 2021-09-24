package com.board.report.dao;

import java.util.List;

import com.board.report.dto.ReportDto;

public interface ReportDao {
	String NAMESPACE = "report.";
	
	//신고 리스트
	public List<ReportDto> ReportList(int pageNum);
	//신고 리스트 카운트
	public int ReportListCount();
	
	//신고 내역(디테일)
	public ReportDto ReportSelectOne(int report_no);
	//신고 삭제
	public int DeleteReport(int report_no);
	
	//신고 하기
	public int ReportInsert(ReportDto reportdto);
}
