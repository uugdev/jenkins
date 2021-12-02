package com.khbill.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.TradeReport;
import com.khbill.service.face.AdminTradeReportService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/report/trade")
public class AdminTradeReportController {

	private static final Logger logger = LoggerFactory.getLogger(AdminTradeReportController.class);
	
	@Autowired private AdminTradeReportService adminTradeReportService;
	
	@RequestMapping(value = "/list")
	public void adminTradeReportList(Model model, Paging paramData) {
		
		logger.info("paraData - {}", paramData);
		
		Paging paging = adminTradeReportService.getPaging(paramData);
		logger.info("paging - {}", paging);
		
		List<TradeReport> tradeReportList = adminTradeReportService.getTradeReportList(paging);
		
		model.addAttribute("tradeReportList", tradeReportList);
		model.addAttribute("paging", paging);
	}
	
	//신고 처리 여부 'y'로 변경하기
	@RequestMapping(value = "/list/statustoy", method = RequestMethod.POST)
	public ModelAndView adminTradeReportStatusToY(TradeReport tradeReport, ModelAndView mav) {
		logger.info("/admin/report/Trade/list/statustoy");
		
		boolean changeStatus = adminTradeReportService.TradeStatusToY(tradeReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}

	//신고 처리 여부 'n'으로 변경하기
	@RequestMapping(value = "/list/statuston", method = RequestMethod.POST)
	public ModelAndView adminTradeReportStatusToN(TradeReport tradeReport, ModelAndView mav) {
		logger.info("/admin/report/trade/list/statuston");
		
		boolean changeStatus = adminTradeReportService.TradeStatusToN(tradeReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}

	//허위 신고 : 신고테이블에서 데이터 삭제
	@RequestMapping(value = "/delete")
	public String delete(int[] reportNo) {
		logger.info("/admin/report/trade/delete");
		
		int size = reportNo.length;
		for(int i=0; i<size; i++) {
			
			adminTradeReportService.setTradeReportDelete(reportNo[i]);
		}
		logger.info("신고 번호: {}", reportNo);
		
		return "redirect:/admin/report/trade/list";
	}
	
	//신고된 후기 게시글 상세
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String adminTradeReportDetail(
			int reportNo, int tradeNo, Model model, HttpSession session
		) {
		logger.info("/admin/report/trade/detail");

		boolean adminLogin = (boolean) session.getAttribute("adminLogin");
		
		TradeReport tradeReport = new TradeReport();
		tradeReport.setReportNo(reportNo);
		tradeReport.setTradeNo(tradeNo);
		
		HashMap<String, Object> tradeDetail = adminTradeReportService.getTradeDetail(tradeReport);
		List<HashMap<String, Object>> tradeComment = adminTradeReportService.getTradeCommentDetail(tradeNo);

		//모델값 전달
		model.addAttribute("adminLogin", adminLogin);
		model.addAttribute("tradeDetail", tradeDetail);
		model.addAttribute("tradeComment", tradeComment);
		
		return "admin/report/trade/detail";
	}
	
}
