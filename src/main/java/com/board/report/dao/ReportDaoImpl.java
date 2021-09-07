package com.board.report.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.report.dto.ReportDto;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//신고 리스트
	@Override
	public List<ReportDto> ReportList(int pageNum) {
		List<ReportDto> reportList = null;
		
		int startRow = (pageNum-1)*10+1;
		int endRow = pageNum*10+1;
		
		Map<String,Integer> paging = new HashMap<String,Integer>();
		paging.put("startRow", startRow);
		paging.put("endRow", endRow);
		
		reportList = sqlSession.selectList(NAMESPACE+"reportList", paging);
		
		return reportList;
	}
	
	//신고 리스트 카운트
	@Override
	public int ReportListCount() {
		int count = sqlSession.selectOne(NAMESPACE+"reportCount");
		return count;
	}

	//신고 디테일(단일 조회)
	@Override
	public ReportDto ReportSelectOne(int report_no) {
		ReportDto reportDetail;
		reportDetail = sqlSession.selectOne(NAMESPACE+"reportdetail", report_no);
		return reportDetail;
	}

	//신고 삭제
	@Override
	public int DeleteReport(int report_no) {
		int result = 0;
		result = sqlSession.delete(NAMESPACE+"deletereport", report_no);
		return result;
	}

}
