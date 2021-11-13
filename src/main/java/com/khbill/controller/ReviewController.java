package com.khbill.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;
	
	@RequestMapping(value = "/list")
	public void list(Model model, Paging paramData) {
	
		//페이징 처리
		Paging paging = reviewService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);	
		
		//게시글 목록 조회
		List<Review> review = reviewService.getReviewList(paging);
		
		model.addAttribute("review", review);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/detail", method=RequestMethod.GET)
	public String detail(
			Review review
			, Item item
			, File file
			, Model model) {
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
		
		return "review/detail";
	}
	
}





