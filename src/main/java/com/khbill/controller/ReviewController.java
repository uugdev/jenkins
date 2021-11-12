package com.khbill.controller;

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
	
	@RequestMapping(value = "/detail")
	public String detail(Review detailReview, Model model) {
		logger.info("/review/detail {}", detailReview);
		
		if( detailReview.getReviewNo() < 1 ) {
			return "redirect:/review/list";
		}
		
		detailReview = reviewService.getReviewDetail(detailReview);
		logger.info("/review/detail 상세보기 {}", detailReview);
		//모델값 전달
		model.addAttribute("detailReview", detailReview);
		
		
		//첨부파일 정보 전달
		File reviewfile = reviewService.getAttachFile(detailReview);
		model.addAttribute("file", reviewfile);
		
		
		return "review/detail";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void write() {
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wrtieProc(Review review, User user, Item item,  MultipartFile file, HttpSession session ) {
		logger.info("{}", review);
		logger.info("{}", item);
		logger.info("{}", file);
		logger.info("테스트");
		
		
		user.setUserId((String) session.getAttribute("userId"));
		user.setUserNick((String) session.getAttribute("userNick"));
				
		reviewService.setReviewWrite(review, user, item, file);
		
		return "redirect:/review/list";
	}
}





