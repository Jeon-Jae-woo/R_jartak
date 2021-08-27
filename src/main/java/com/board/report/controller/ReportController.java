package com.board.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	@RequestMapping(value="reportForm")
	public String reportForm() {
		return "report";
	}
	
	@RequestMapping(value="admin/report")
	public String adminReportBoard() {
		return "adminReportBoard";
	}
	
}
