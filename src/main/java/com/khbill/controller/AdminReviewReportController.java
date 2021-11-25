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

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.service.face.AdminReviewReportService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/admin/report/review")
public class AdminReviewReportController {
	
private static final Logger logger = LoggerFactory.getLogger(AdminReviewReportController.class);
	
	@Autowired private AdminReviewReportService adminReviewReportService;
	
	@RequestMapping(value = "/list")
	public void adminReviewReportList(Model model, Paging paramData) {
		logger.info("/admin/report/review/list");
		
		//페이징 처리
		Paging paging = adminReviewReportService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<ReviewReport> reviewReportList = adminReviewReportService.getReviewReportList(paging);
		
		model.addAttribute("reviewReportList", reviewReportList);
		model.addAttribute("paging", paging);
	}

	//신고 처리 여부 'y'로 변경하기
	@RequestMapping(value = "/list/statustoy", method = RequestMethod.POST)
	public ModelAndView adminReviewReportStatusToY(ReviewReport reviewReport, ModelAndView mav) {
		logger.info("/admin/review/report/list/statustoy");
		
		boolean changeStatus = adminReviewReportService.ReviewStatusToY(reviewReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}

	//신고 처리 여부 'n'으로 변경하기
	@RequestMapping(value = "/list/statuston", method = RequestMethod.POST)
	public ModelAndView adminReviewReportStatusToN(ReviewReport reviewReport, ModelAndView mav) {
		logger.info("/admin/report/review/list/statuston");
		
		boolean changeStatus = adminReviewReportService.ReviewStatusToN(reviewReport);
		
		mav.addObject("changeStatus",changeStatus);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String adminReviewReportDetail(
			Review review, ReviewReport reviewReport, ReviewComment reviewComment
			, Item item, File file, Model model, HttpSession session
		) {
		logger.info("/admin/report/review/detail");
		
		HashMap<String, Object> reviewMap = adminReviewReportService.getReviewDetail(review);
		boolean adminLogin = (boolean) session.getAttribute("adminLogin");
		
		//상품 정보 전달
		int itemNo = Integer.parseInt(String.valueOf(reviewMap.get("ITEM_NO")));
		item = adminReviewReportService.getReviewItem(itemNo);
		logger.info("아이템 번호: {}", itemNo);
	
		//첨부파일 정보 전달
		int fileNo = Integer.parseInt(String.valueOf(reviewMap.get("FILE_NO")));
		file = adminReviewReportService.getReviewFile(fileNo);
		logger.info("파일 번호: {}", fileNo);
		
		//모델값 전달
		model.addAttribute("adminLogin", adminLogin);
		model.addAttribute("review", reviewMap);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
		
		//댓글 리스트 전달
		List<HashMap<String, Object>> commentList = adminReviewReportService.getReviewComList(reviewComment);
		model.addAttribute("commentList", commentList);
		
		logger.info("commentList 댓글list: {}", commentList);
		
		return "admin/report/review/detail";
	}
	
}
















