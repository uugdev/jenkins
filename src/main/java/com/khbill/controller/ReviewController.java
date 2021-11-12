package com.khbill.controller;

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
import com.khbill.dto.User;
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
//			, Ask ask
			, Item item
			, File file
			, Model model) {
		logger.info("/review/detail [GET]");
		
		if( review.getReviewNo() < 1 ) {
			return "redirect:/review/list";
		}
		
		
		review = reviewService.getReviewDetail(review);
		item = reviewService.getReviewItem(review.getItemNo());
		file = reviewService.getReviewFile(review.getFileNo());
		
		logger.info("review: {}", review);
		logger.info("item : {}", item);
		logger.info("file : {}", file);
		
		//모델값 전달
		model.addAttribute("review", review);
//		model.addAttribute("ask", ask);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
		
		return "review/detail";
	}
	
}





