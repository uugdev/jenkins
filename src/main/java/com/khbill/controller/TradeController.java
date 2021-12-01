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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.khbill.dto.File;
import com.khbill.dto.Trade;
import com.khbill.dto.TradeComment;
import com.khbill.dto.TradeReport;
import com.khbill.dto.TradeScrap;
import com.khbill.service.face.TradeService;
import com.khbill.util.Paging;

@Controller
public class TradeController {
	
	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	@Autowired private TradeService tradeService;
	
	//거래 게시판 목록
	@RequestMapping(value = "/trade/list")
	public void tradeList(
				Model model
				, Paging paramData
			) {
		
	}
	
	//거래 게시판 목록 ajax
	@RequestMapping(value = "/trade/list/ajax")
	public String tradeHitList(
				Model model
				, Paging paramData
			) {
		
		logger.info("param {}", paramData);
		
		Paging paging = tradeService.getPaging(paramData);
		logger.info("paging.target : {}",paging.getTarget());
		
		List<Trade> tradeList = tradeService.getTradeList(paging);
		
		model.addAttribute("tradeList", tradeList);
		model.addAttribute("paging", paging);
		
		if(paging.getTarget() != null) {
			if(paging.getTarget().equals("3")) { //사진
				return "trade/ajaxpiclist";
			}
		}
		
		return "trade/ajaxlist";
	}
	
	//거래 게시글 상세보기
	@RequestMapping(value = "/trade/detail")
	public String tradeDetail(
				Model model
				, HttpSession session
				, int tradeNo
			) {
		
		if( tradeNo < 1 ) {
			return "redirect:/trade/list";
		}
		
		HashMap<String, String> tradeDetail = tradeService.getTradeDetail(tradeNo);
		List<HashMap<String, String>> tradeComment = tradeService.getTradeCommentDetail(tradeNo);
		
		//스크랩 상태 조회
		TradeScrap tradeScrap = new TradeScrap();
		tradeScrap.setTradeNo(tradeNo);
		
		int userNo = 0;
		if(session.getAttribute("userNo") != null) {
			userNo = (Integer) session.getAttribute("userNo");
		}
		
		tradeScrap.setUserNo(userNo);
		
		//스크랩 상태 전달
		boolean isScrap = tradeService.isScrap(tradeScrap);
		
		logger.info("tradeDetail - {}", tradeDetail);
		logger.info("tradeComment - {}", tradeComment);
		logger.info("reviewScrap{}", tradeScrap);	
		
		model.addAttribute("isScrap", isScrap);
		model.addAttribute("tradeDetail", tradeDetail);
		model.addAttribute("tradeComment", tradeComment);
		
//		if(session.getAttribute("login") == null) {
//			if(session.getAttribute("referer")!=null) {
//				session.removeAttribute("referer");
//			}
//			session.setAttribute("referer", "/trade/detail?tradeNo=" + tradeNo);
//		}
		
		return "trade/detail";
		
	}
	
	//거래 게시글 작성
	@RequestMapping(value = "/trade/write", method = RequestMethod.GET)
	public void tradeGetWrite() {}

	//거래 게시글 작성
	@RequestMapping(value = "/trade/write", method = RequestMethod.POST)
	public String tradePostWrite(
				HttpSession session
				, MultipartFile file
				, Trade trade
			) {
		logger.info("session - {}", session);
		logger.info("file - {}", file);
		logger.info("trade - {}", trade);
		
		String tradeNo = tradeService.setTradeWrite(session, file, trade);
		
		return "redirect:/trade/detail?tradeNo=" + tradeNo;
	}
	
	//거래 게시글 업데이트.GET
	@RequestMapping(value = "/trade/update", method = RequestMethod.GET)
	public void tradeGetUpdate(
			Model model
			, int tradeNo
			) {
		
		HashMap<String, String> tradeDetail = tradeService.getTradeDetail(tradeNo);
		
		model.addAttribute("tradeDetail", tradeDetail);
		
	}

	//거래 게시글 업데이트.POST
	@RequestMapping(value = "/trade/update", method = RequestMethod.POST)
	public String tradePostUpdate(
			MultipartFile file
			, Trade trade
			) {
		
		logger.info("trade - {}", trade);
		logger.info("file - {}", file);
		
		tradeService.setTradeUpdate(file, trade);
		
		return "redirect:/trade/detail?tradeNo=" + trade.getTradeNo();
		
	}
	
	//거래 게시글 파일 삭제 ajax
	@RequestMapping(value = "/trade/update/deletefile", method = RequestMethod.POST)
	public ModelAndView tradeUpdateDeleteFile(
			ModelAndView mav
			, File file
			) {
		
		boolean success = tradeService.setTradeUpdateDeleteFile(file);
		
		logger.info("success - {}", success);
		
		mav.addObject("success", success);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
	//거래 게시글 삭제
	@RequestMapping(value = "/trade/delete")
	public String tradeDelete(
				int tradeNo
			) {
		tradeService.setTradeDelete(tradeNo);
		
		return "redirect:/trade/list";
	}
	
	//거래 게시글 댓글 작성
	@RequestMapping(value = "/trade/comment/write", method = RequestMethod.POST)
	public ModelAndView tradeCommentWrite(
				HttpSession session
				, TradeComment tradeComment
				, ModelAndView mav
			) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		tradeComment.setUserNo(userNo);
		tradeService.setTradeCommentWrite(tradeComment);
		TradeComment addComment = tradeService.getTradeCommentWriteByUserNo(userNo);
		String userNick = tradeService.getUserNickByUserNo(tradeComment.getUserNo());
		String gradeUrl = tradeService.getGradeUrlByUserNo(tradeComment.getUserNo());
		
		logger.info("userNo {}", userNo);
		logger.info("userNick - {}", userNick);
		logger.info("tradeComment {}", tradeComment);
		logger.info("addComment {}", addComment);
		
		boolean success = false;
		
		if(addComment != null) {
			success = true;
		} else {
			success = false;
		}
		
		mav.addObject("userNick", userNick);
		mav.addObject("gradeUrl", gradeUrl);
		mav.addObject("success", success);
		mav.addObject("addComment", addComment);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	//거래 게시글 댓글 삭제
	@RequestMapping(value = "/trade/comment/delete")
	public void tradeCommentDelete(
				int tradeComNo
				, Writer writer
			) {
		
		logger.info("tradeComNo - {}", tradeComNo);
		
		boolean success = tradeService.setTradeCommentDelete(tradeComNo);
		
		try {
			writer.append("{\"success\":"+success+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//댓글 수정
	@RequestMapping(value = "/trade/comment/update")
	public ModelAndView tradeCommentUpdate(
				ModelAndView mav
				, TradeComment tradeComment
				) {
		logger.info("AJAX COMMENT UPDATE");
		logger.info("tradeComment - {}", tradeComment);
		
		boolean success = false;
		
		TradeComment resultTradeComment = tradeService.setTradeCommentUpdate(tradeComment);
		
		logger.info("resultTradeComment : {}", resultTradeComment);
		
		if(tradeComment.getTradeComNo() == resultTradeComment.getTradeComNo()) {
			success = true;
		} else {
			success = false;
		}
		
		mav.addObject("success", success);
		mav.addObject("tradeComment", resultTradeComment);
		mav.setViewName("jsonView");
		
		return mav; 
	}
	
	@RequestMapping(value = "/trade/report")
	public ModelAndView tradeReport(
				int tradeNo
				, TradeReport tradeReport
				, HttpSession session
				, ModelAndView mav
			) {
		logger.info("tradeReport: {}", tradeReport);
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		tradeReport.setTradeNo(tradeNo);
		tradeReport.setReporterNo(userNo);
		
		boolean reportCheck =  tradeService.tradeReportByTradeNoLoginUserNo(tradeReport);
		
		if(reportCheck) {
			tradeService.setTradeReport(tradeReport);
		}
		
		mav.addObject("reportCheck", reportCheck);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/trade/scrap")
	public ModelAndView scrap(
				int tradeNo
				, TradeScrap tradeScrap
				, ModelAndView mav
				, HttpSession session
			) {
		
		//스크랩 정보 토글
		tradeScrap.setTradeNo(tradeNo);
		tradeScrap.setUserNo((Integer) session.getAttribute("userNo"));
		
		boolean resultScrap = tradeService.setScrap(tradeScrap);
		
		mav.addObject("resultScrap",resultScrap);
		mav.setViewName("jsonView");
		
		return mav;
		
	}
	
		
	

}
