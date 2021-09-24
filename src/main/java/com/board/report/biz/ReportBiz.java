package com.board.report.biz;

import java.util.List;
import java.util.Map;

import com.board.report.dto.ReportDto;
import com.util.pagingDto;

public interface ReportBiz {
	//신고 리스트
	public List<ReportDto> ReportListBiz(int pageNum);
	//신고 리스트 카운트
	public pagingDto ReportListCountBiz(int pageNum);
	
	//신고 내역(디테일)
	public ReportDto ReportDetailBiz(int report_no);
	
	//신고 처리
	public int ReportProcessing(Map<String, Object> reportInfo);
	
	//신고 하기
	public int ReportInsertBiz(ReportDto reportdto);
}
