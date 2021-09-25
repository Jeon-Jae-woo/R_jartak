package com.board.report.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.report.dao.ReportDao;
import com.board.report.dto.ReportDto;
import com.member.dao.MemberDao;
import com.util.pagingDto;

@Service
@Transactional
public class ReportBizImpl implements ReportBiz {

	@Autowired
	private ReportDao reportdao;
	@Autowired
	private pagingDto paging;
	@Autowired
	private MemberDao memberdao;
	
	
	//신고 리스트
	@Override
	public List<ReportDto> ReportListBiz(int pageNum) {
		List<ReportDto> reportList;
		reportList = reportdao.ReportList(pageNum);
		return reportList;
	}

	//신고 리스트 카운트
	@Override
	public pagingDto ReportListCountBiz(int pageNum) {
		paging.setPageNum(pageNum);
		int size = 0;
		size = reportdao.ReportListCount();
		paging.setTotalCount(size);
		paging.pagination();
		return paging;
	}

	//신고 디테일
	@Override
	public ReportDto ReportDetailBiz(int report_no) {
		ReportDto reportdetail = reportdao.ReportSelectOne(report_no);
		return reportdetail;
	}

	//신고 처리
	@Override
	public int ReportProcessing(Map<String, Object> reportInfo) {
		//회원 상태 변경
		int status_no = Integer.parseInt(reportInfo.get("status_no").toString());
		String target_nickname = reportInfo.get("target_nickname").toString();
		
		int memStatusResult = memberdao.ChangeStatus(target_nickname, status_no);
		
		if(memStatusResult>0) {
			//신고 처리 완료 후 삭제
			int report_no = Integer.parseInt(reportInfo.get("report_no").toString());
			int result = reportdao.DeleteReport(report_no);
			return result;
		}
		else {
			return -1;
		}
		
	}
	
	//신고하기
	@Override
	public int ReportInsertBiz(ReportDto reportdto) {
		int result = reportdao.ReportInsert(reportdto);
		return result;
	}

}
