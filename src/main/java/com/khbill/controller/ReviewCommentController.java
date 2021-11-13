package com.khbill.controller;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbill.dto.ReviewComment;
import com.khbill.service.face.ReviewService;

@Controller
@RequestMapping(value = "/review")
public class ReviewCommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewCommentController.class);
	
	@Autowired private ReviewService reviewService;	
	
	@RequestMapping(value = "/comment/write", method = RequestMethod.POST)
	public String write(int reviewNo, ReviewComment reviewComment, Model model, HttpSession session) {
		
		logger.info("/comment/write [POST]");
		
		int userNo = (Integer) session.getAttribute("userNo");
		reviewComment.setUserNo(userNo);
		reviewComment.setReviewNo(reviewNo);
		reviewService.setReviewCommentWrite(reviewComment);
		
		logger.info("userNo {}", userNo);
		logger.info("reviewNo {}", reviewNo);
		logger.info("reviewComment {}", reviewComment);
		
		return "redirect:/review/detail?reviewNo=" + reviewComment.getReviewNo();
	}
	
	
	
	public void delete(ReviewComment reviewComment, Writer writer, Model model) {
		
		boolean success = reviewService.deleteReviewComment(reviewComment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
