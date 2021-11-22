package com.khbill.controller;

import java.io.IOException;
import java.io.Writer;
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

import com.khbill.dto.File;
import com.khbill.dto.Item;
import com.khbill.dto.Review;
import com.khbill.dto.ReviewComment;
import com.khbill.service.face.AdminReviewService;
import com.khbill.util.Paging;


@Controller
@RequestMapping(value = "/admin/review")
public class AdminReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminReviewController.class);
	
	@Autowired private AdminReviewService adminReviewService;
	
	@RequestMapping(value = "/list")
	public void adminReviewList(Model model, Paging paramData) {
	
		//페이징 처리
		Paging paging = adminReviewService.getPaging(paramData);
		logger.info("페이징 처리 {}", paging);
		
		//게시글 목록 조회
		List<Review> reviewList = adminReviewService.getReviewList(paging);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String adminReviewDetail(
			Review review, ReviewComment reviewComment
			, Item item, File file, Model model, HttpSession session
		) {
		logger.info("/admin/review/detail [GET]");
		
		HashMap<String, Object> reviewMap = adminReviewService.getReviewDetail(review);
		logger.info("reviewMap 테스트: {}", reviewMap);
		
		boolean adminLogin = (boolean) session.getAttribute("adminLogin");
		
		//상품 정보 전달
		int itemNo = Integer.parseInt(String.valueOf(reviewMap.get("ITEM_NO")));
		item = adminReviewService.getReviewItem(itemNo);
		logger.info("아이템 번호: {}", itemNo);
	
		//첨부파일 정보 전달
		int fileNo = Integer.parseInt(String.valueOf(reviewMap.get("FILE_NO")));
		file = adminReviewService.getReviewFile(fileNo);
		logger.info("파일 번호: {}", fileNo);
		
//		logger.info("review: {}", reviewMap);
//		logger.info("item : {}", item);
//		logger.info("file : {}", file);
		
		//모델값 전달
		model.addAttribute("adminLogin", adminLogin);
		model.addAttribute("review", reviewMap);
		model.addAttribute("item", item);
		model.addAttribute("file", file);
		
		//댓글 리스트 전달
		List<HashMap<String, Object>> commentList = adminReviewService.getReviewComList(reviewComment);
		model.addAttribute("commentList", commentList);
		
		logger.info("commentList: {}", commentList);
		
		return "admin/review/detail";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(int[] reviewNo) {
		logger.info("/admin/review/delete");
		
		int size = reviewNo.length;
		for(int i=0; i<size; i++) {
			
			adminReviewService.setReviewCommentDelete(reviewNo[i]);
			adminReviewService.setReviewDelete(reviewNo[i]);
			
		}
		
		logger.info("reviewNo{}", reviewNo);
		
		return "redirect:/admin/review/list";
	}
	
	@RequestMapping(value = "/comment/delete")
	public void adminReviewComDelete(ReviewComment reviewComment, Writer writer, Model model) {
		logger.info("/admin/review/comment/delete");
		
		boolean success = adminReviewService.deleteReviewComment(reviewComment);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}