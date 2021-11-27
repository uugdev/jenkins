package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.AskReport;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewReport;
import com.khbill.service.face.AdminAskReportService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/report/ask")
public class AdminAskReportController {
	
private static final Logger logger = LoggerFactory.getLogger(AdminAskReportController.class);
	
	@Autowired private AdminAskReportService adminAskReportService;
	
	@RequestMapping(value = "/list")
	public void adminAskReportList(Model model, Paging paramData) {
		
		//페이징 처리
		Paging paging = adminAskReportService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<AskReport> askReportList = adminAskReportService.getAskReportList(paging);
		
		model.addAttribute("askReportList", askReportList);
		model.addAttribute("paging", paging);
	}
	

	//신고 처리 여부 'y'로 변경하기
	@RequestMapping(value = "/list/statustoy", method = RequestMethod.POST)
	public ModelAndView adminAskReportStatusToY(AskReport askReport, ModelAndView mav) {
		logger.info("/admin/report/ask/list/statustoy");
		
		boolean changeStatus = adminAskReportService.AskStatusToY(askReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}

	//신고 처리 여부 'n'으로 변경하기
	@RequestMapping(value = "/list/statuston", method = RequestMethod.POST)
	public ModelAndView adminAskReportStatusToN(AskReport askReport, ModelAndView mav) {
		logger.info("/admin/report/ask/list/statuston");
		
		boolean changeStatus = adminAskReportService.AskStatusToN(askReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//허위 신고 : 신고테이블에서 데이터 삭제
	@RequestMapping(value = "/delete")
	public String delete(int[] reportNo) {
		logger.info("/admin/report/ask/delete");
		
		int size = reportNo.length;
		for(int i=0; i<size; i++) {

			adminAskReportService.setAskReportDelete(reportNo[i]);
		}
		logger.info("신고 번호: {}", reportNo);
		
		return "redirect:/admin/report/ask/list";
	}
	
}
