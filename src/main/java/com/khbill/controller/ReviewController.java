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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.Ask;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.dto.ReviewReport;
import com.khbill.dto.ReviewScrap;
import com.khbill.dto.User;
import com.khbill.service.face.AskService;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;
	@Autowired private AskService askService;
	
	//후기 게시글 목록
	@RequestMapping(value = "/list")
	public void reviewList(Model model, Paging paramData) {
	
		//페이징 처리
		Paging paging = reviewService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<Review> reviewList = reviewService.getReviewList(paging);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
	}
	
	//후기 게시글 조회순
	@RequestMapping(value = "/hitlist")
	public void getAskHitList(Model model, Paging paramData) {
		logger.info("/review/votenum/list [GET]");
		
		Paging paging = reviewService.getPaging(paramData);
		List<Review> reviewList = reviewService.getReviewHitList(paging);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
	}
	
	//후기 게시글 상세
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String reviewDetail(
			Review review, ReviewComment reviewComment
			, Item item, File file, Model model, HttpSession session
		) {
		logger.info("/review/detail [GET]");
		
		if( review.getReviewNo() < 1 ) {
			return "redirect:/review/list";
		}
		
		HashMap<String, Object> reviewMap = reviewService.getReviewDetail(review);
		logger.info("reviewMap 테스트: {}", reviewMap);
		
		//상품 정보 전달
		int itemNo = Integer.parseInt(String.valueOf(reviewMap.get("ITEM_NO")));
		item = reviewService.getReviewItem(itemNo);
		logger.info("아이템 번호: {}", itemNo);
	
		//첨부파일 정보 전달
		int fileNo = Integer.parseInt(String.valueOf(reviewMap.get("FILE_NO")));
		file = reviewService.getReviewFile(fileNo);
		logger.info("파일 번호: {}", fileNo);
		
		//모델값 전달
		model.addAttribute("review", reviewMap);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
	
		
		//댓글 리스트 전달
		List<HashMap<String, Object>> commentList = reviewService.getReviewComList(reviewComment);
		model.addAttribute("commentList", commentList);
		
		logger.info("commentList: {}", commentList);
		
		
		//스크랩 상태 조회
		ReviewScrap reviewScrap = new ReviewScrap();
		reviewScrap.setReviewNo(review.getReviewNo());
		
		int userNo = (Integer) session.getAttribute("userNo");
		reviewScrap.setUserNo(userNo);
		
		//스크랩 상태 전달
		boolean isScrap = reviewService.isScrap(reviewScrap);
		model.addAttribute("isScrap", isScrap);
		
		logger.info("reviewScrap{}", reviewScrap);		
		
		return "review/detail";
	}

	//후기게시글 작성 - GET
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void reviewWrite(int askNo, Model model) {
		logger.info("/review/write [GET]");
		
		//질문 게시판에 작성한 글 불러오기
		Ask ask = askService.getAskDetail(askNo);
		Item item = askService.getItem(ask.getProductNo());
		User user = askService.getUserInfoByUserNo(ask.getUserNo());
		
		model.addAttribute("user",user);
		model.addAttribute("ask",ask);
		model.addAttribute("item",item);
	}
	
	//후기 게시글 작성 - POST
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reviewWriteProc(
			Review review, User user, int askNo, Item item
			, MultipartFile file, HttpSession session
		) {
		
		logger.info("askNo=123 - {}", askNo);
		
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNick((String) session.getAttribute("userNick"));
		
		item.setItemNo(askService.getItem(askNo).getItemNo());
		
		review.setUserNo(userNo);
		
		reviewService.setReviewWrite(review, item, file);

		return "redirect:/review/list";
	}
	
	//후기 게시글 수정 - GET
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String reviewUpdate(Review review, Item item, File file,  Model model) {
		logger.info("/review/update [GET]");
		
		// 게시글 번호가 1보다 작으면 목록으로 보내기
		if(review.getReviewNo() < 1) {
			return "redirect:/review/list";
		}
		
		//게시글 상세 정보 전달
		HashMap<String, Object> reviewMap = reviewService.getReviewDetail(review);
		logger.info("review{}", review.getReviewNo());
		
		int itemNo = Integer.parseInt(String.valueOf(reviewMap.get("ITEM_NO")));
		item = reviewService.getReviewItem(itemNo);
		logger.info("아이템 번호: {}", itemNo);
	
		int fileNo = Integer.parseInt(String.valueOf(reviewMap.get("FILE_NO")));
		file = reviewService.getReviewFile(fileNo);
		logger.info("파일 번호: {}", fileNo);
		
		logger.info("review: {}", reviewMap);
		logger.info("item : {}", item);
		logger.info("file : {}", file);
		
		//게시글 상세 모델값 전달
		model.addAttribute("review", reviewMap);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
		
		return "review/update";
	}
	
	//후기 게시글 수정 - POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String reviewUpdateProc(
			Review review, User user, Item item
			, MultipartFile file, HttpSession session
		) {
		logger.info("/review/update [POST]");
		logger.info("review{}", review.getReviewNo());
		
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNick((String) session.getAttribute("userNick"));
		
		review.setUserNo(userNo);
		
		reviewService.setReviewUpdate(review, file);
		
		logger.info("file{}", review.getFileNo());
		
		return "redirect:/review/detail?reviewNo="+review.getReviewNo();
		
	}
	
	//후기 게시글 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteProc(Review review) {
		
		reviewService.setReviewCommentDelete(review);
		reviewService.setReviewDelete(review);
		
		return "redirect:/review/list";
	}
	
	//후기 게시글 스크랩
	@RequestMapping(value = "/scrap", method = RequestMethod.GET)
	public ModelAndView scrap(int reviewNo, ReviewScrap reviewScrap, ModelAndView mav, HttpSession session) {
		logger.info("/review/scrap [GET]");
		
		//스크랩 정보 토글
		reviewScrap.setReviewNo(reviewNo);
		reviewScrap.setUserNo((Integer) session.getAttribute("userNo"));
		
		boolean resultScrap = reviewService.scrap(reviewScrap);
		
		mav.addObject("resultScrap",resultScrap);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//후기 게시글 신고
	@RequestMapping(value ="/report",method = RequestMethod.POST)
	public ModelAndView reviewReport(int reviewNo, ReviewReport reviewReport, HttpSession session, ModelAndView mav) {
		logger.info("/reviewreport [POST]");
		
		logger.info("reviewReport: {}", reviewReport);
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		reviewReport.setReviewNo(reviewNo);
		reviewReport.setReporterNo(userNo);
		
		boolean reportCheck =  reviewService.reviewReportByReviewNoLoginUserNo(reviewReport);
		
		if(reportCheck) {
			reviewService.setReviewReport(reviewReport);
		}
		
		mav.addObject("reportCheck", reportCheck);
		mav.setViewName("jsonView");
		
		return mav;
	}

}





