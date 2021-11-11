package com.khbill.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.service.face.QnaService;
import com.khbill.util.Paging;


@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired QnaService qnaService;
	
	@RequestMapping(value="/qna/list")
	public void qnaList(HttpSession session, Model model, Paging paramData) {
		int userNo = (Integer) session.getAttribute("userNo");
		
		Paging paging = qnaService.getPaging(paramData, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<Qna> list = qnaService.getQnaList(map);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value="/qna/detail")
	public void qnaDetail(int qnaNo, Model model) {
		Qna qna = qnaService.getQnaDetail(qnaNo);
		QnaComment qnaComment = qnaService.getQnaComment(qnaNo);
		
		model.addAttribute("qna", qna);
		model.addAttribute("qnaComment", qnaComment);
	}
}
