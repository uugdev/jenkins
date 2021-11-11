package com.khbill.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Review;
import com.khbill.service.face.ReviewService;
import com.khbill.util.Paging;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;
	
	@RequestMapping(value = "/list")
	public void list(Paging paramData, Model model) {
		logger.info("/review/list");
		
		//페이징 계산
		Paging paging = reviewService.getPaging( paramData );
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<Review> list = reviewService.getReviewList(paging);
		for(Review r : list) {
			logger.info("후기 목록: {}", r);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
}
