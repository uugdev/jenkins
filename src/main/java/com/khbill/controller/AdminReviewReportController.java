package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.ReviewReport;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/reviewreport")
public class AdminReviewReportController {
	
private static final Logger logger = LoggerFactory.getLogger(AdminReviewReportController.class);
	
	@Autowired private AdminReviewReportService adminReviewReportService;
	
	@RequestMapping(value = "/list")
	public void adminReviewReportList(Model model, Paging paramData) {
		logger.info("/admin/reviewreport/list");
		
		//페이징 처리
		Paging paging = adminReviewReportService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<ReviewReport> reviewReportList = adminReviewReportService.getReviewReportList(paging);
		
		model.addAttribute("reviewReportList", reviewReportList);
		model.addAttribute("paging", paging);
	}
}
