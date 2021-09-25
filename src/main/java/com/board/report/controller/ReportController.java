package com.board.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public String reportForm(Model model, @RequestParam("targetNickname")String targetNickname) {
		System.out.println(targetNickname);
		model.addAttribute("targetNickname", targetNickname);
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
	
	//신고등록
	@RequestMapping(value="reportIn.log", method=RequestMethod.POST)
	public String report(Model model, ReportDto reportdto, HttpServletRequest request) {
		
		String nickname = (String)request.getSession().getAttribute("nickname");
		reportdto.setNickname(nickname.trim());
		reportdto.setTarget_nickname(reportdto.getTarget_nickname().trim());
		int result = reportbiz.ReportInsertBiz(reportdto);
		
		if(result > 0) {
			model.addAttribute("msg", "신고되었습니다");	
		}else {
			model.addAttribute("msg", "신고에 실패했습니다");
		}
		
		return "reportAlert";
	}
}
