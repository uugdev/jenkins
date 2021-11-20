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
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.ReviewComment;
import com.khbill.dto.TradeComment;
import com.khbill.service.face.ReviewService;

@Controller
@RequestMapping(value = "/review")
public class ReviewCommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewCommentController.class);
	
	@Autowired private ReviewService reviewService;	
	
	//후기 게시글 댓글 작성
//	@RequestMapping(value = "/comment/write", method = RequestMethod.POST)
//	public String write(int reviewNo, ReviewComment reviewComment, Model model, HttpSession session) {	
//		logger.info("/comment/write [POST]");
//		
//		int userNo = (Integer) session.getAttribute("userNo");
//		reviewComment.setUserNo(userNo);
//		reviewComment.setReviewNo(reviewNo);
//		reviewService.setReviewCommentWrite(reviewComment);
//		
//		logger.info("userNo {}", userNo);
//		logger.info("reviewNo {}", reviewNo);
//		logger.info("reviewComment {}", reviewComment);
//		
//		return "redirect:/review/detail?reviewNo=" + reviewComment.getReviewNo();
//	}

	//후기 게시글 댓글 작성
	@RequestMapping(value = "/comment/write", method = RequestMethod.POST)
	public ModelAndView reviewCommentWrite(HttpSession session, ReviewComment reviewComment, ModelAndView mav) {
	
		int userNo = (Integer) session.getAttribute("userNo");
		reviewComment.setUserNo(userNo);
		reviewService.setReviewCommentWrite(reviewComment);
		ReviewComment addComment = reviewService.getReviewCommentWriteByUserNo(userNo);
		String userNick = reviewService.getUserNickByUserNo(reviewComment.getUserNo());
		
		logger.info("userNo {}", userNo);
		logger.info("userNick - {}", userNick);
		logger.info("reviewComment {}", reviewComment);
		logger.info("addComment {}", addComment);
		
		boolean success = false;
		
		if(addComment != null) {
			success = true;
		}
		
		mav.addObject("userNick", userNick);
		mav.addObject("success", success);
		mav.addObject("addComment", addComment);
		mav.setViewName("jsonView");
		
		return mav; 
}
	
	//후기 게시글 댓글 수정
	@RequestMapping(value = "/comment/update", method = RequestMethod.POST)
	public ModelAndView reviewCommentUpdate(ModelAndView mav, ReviewComment reviewComment) {
		logger.info("/review/comment/update");
		logger.info("reviewComment - {}", reviewComment);

		boolean success = false;

		ReviewComment resultReviewComment = reviewService.setReviewCommentUpdate(reviewComment);

		if (reviewComment.getReviewComNo() == resultReviewComment.getReviewComNo()) {
			success = true;
		} else {
			success = false;
		}
		
		logger.info("resultReviewComment{}", resultReviewComment);
		
		mav.addObject("success", success);
		mav.addObject("reviewComment", reviewComment);
		mav.setViewName("jsonView");

		return mav;
	}
	
	//후기 게시글 삭제
	@RequestMapping(value = "/comment/delete")
	public void delete(ReviewComment reviewComment, Writer writer, Model model) {
		
		boolean success = reviewService.deleteReviewComment(reviewComment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
