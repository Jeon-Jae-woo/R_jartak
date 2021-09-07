package com.board.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.report.biz.ReportBiz;
import com.board.report.dto.ReportDto;
import com.util.pagingDto;

@Controller
public class ReportController {

	Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	private ReportBiz reportbiz;
	
	//신고 폼 전환
	@RequestMapping(value="/reportForm.log", method=RequestMethod.GET)
	public String reportForm() {
		return "report";
	}
	
	//신고 디테일
	@RequestMapping(value="/adminReportDetail", method=RequestMethod.GET)
	public String adminReportDetail(Model model, @RequestParam("report_no")int report_no) {
		logger.info("[ADMIN REPORT DETAIL]");
		
		ReportDto reportdetail = reportbiz.ReportDetailBiz(report_no);
		model.addAttribute("reportdetail",reportdetail);
		return "adminReportDetail";
	}
	
	//관리자, 신고 리스트
	@RequestMapping(value="/adminReportList", method=RequestMethod.GET)
	public String adminReportBoard(Model model, @RequestParam("pageNum")int pageNum) {
		logger.info("[ADMIN REPORT BOARD]");
		
		List<ReportDto> reportList = reportbiz.ReportListBiz(pageNum);
		pagingDto paging = reportbiz.ReportListCountBiz(pageNum);
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("paging", paging);
		
		return "adminReportBoard";
	}
	
	//신고 처리
	@RequestMapping(value="/adminReportProcessing", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> adminReportProcessing(@RequestBody Map<String,Object> requestData){
		
		int result = reportbiz.ReportProcessing(requestData);
		Map<String,Object> data = new HashMap<String, Object>();
		
		if(result>0) {	
			data.put("status", HttpStatus.OK);
			return data;
		}else {
			data.put("status", HttpStatus.BAD_REQUEST);
			return data;
		}
	}
	
}
