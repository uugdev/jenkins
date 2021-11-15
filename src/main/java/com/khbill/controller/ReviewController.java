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

import com.khbill.dto.Ask;
import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
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
	
	@RequestMapping(value = "/list")
	public void reviewList(Model model, Paging paramData) {
	
		//페이징 처리
		Paging paging = reviewService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);	
		
		//게시글 목록 조회
		List<Review> review = reviewService.getReviewList(paging);
		
		model.addAttribute("review", review);
		model.addAttribute("paging", paging);
	}
	
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String reviewDetail(
			Review review, ReviewComment reviewComment
			, Item item, File file, Model model
		) {
		logger.info("/review/detail [GET]");
		
		if( review.getReviewNo() < 1 ) {
			return "redirect:/review/list";
		}
		
		HashMap<String, Object> reviewMap = reviewService.getReviewDetail(review);
		logger.info("reviewMap 테스트: {}", reviewMap);
		
		int itemNo = Integer.parseInt(String.valueOf(reviewMap.get("ITEM_NO")));
		item = reviewService.getReviewItem(itemNo);
		logger.info("아이템 번호: {}", itemNo);
	
		int fileNo = Integer.parseInt(String.valueOf(reviewMap.get("FILE_NO")));
		file = reviewService.getReviewFile(fileNo);
		logger.info("파일 번호: {}", fileNo);
		
		logger.info("review: {}", reviewMap);
		logger.info("item : {}", item);
		logger.info("file : {}", file);
		
		//모델값 전달
		model.addAttribute("review", reviewMap);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
		
		//댓글 리스트 전달
		List<HashMap<String, Object>> commentList = reviewService.getReviewComList(reviewComment);
		model.addAttribute("commentList", commentList);
		
		logger.info("commentList: {}", commentList);
		
		return "review/detail";
	}

	
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
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reviewWriteProc(
			Review review, User user, Ask ask, Item item
			, MultipartFile file, HttpSession session
		) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		user.setUserNick((String) session.getAttribute("userNick"));
		
		review.setUserNo(userNo);
		
		reviewService.setReviewWrite(review, item, file);

		return "redirect:/review/list";
	}
	
	
	@RequestMapping(value="/download")
	public String download(int fileNo, Model model) {
		
		File file = reviewService.getReviewFile(fileNo);
		
		model.addAttribute("downFile", file);
		
		return "down";
	}
	
	
	
	
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
		
//		//게시글 첨부파일 전달
//		file = reviewService.getAttachFile(review);
//		model.addAttribute("file", file);
		
		return "review/update";
	}
	
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
		
		reviewService.setReviewUpdate(review, item, file);
		
		logger.info("file{}", review.getFileNo());
		
		return "redirect:/review/detail?reviewNo="+review.getReviewNo();
		
	}
	
//	@RequestMapping(value="/delete", method=RequestMethod.GET)
//	public String deleteProc(Review review) {
//		
//		reviewService.setReviewCommentDelete(review);
//		reviewService.setReviewDelete(review);
//		
//		return "redirect:/review/list";
//	}
}





