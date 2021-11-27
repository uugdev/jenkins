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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbill.dto.Qna;
import com.khbill.dto.QnaComment;
import com.khbill.service.face.QnaService;
import com.khbill.util.Paging;


@Controller
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired QnaService qnaService;
	
	@RequestMapping(value="/qna/main")
	public void qnaMain() {}
	
	@RequestMapping(value="/qna/list")
	public String qnaList(HttpSession session, Model model, Paging paramData) {
		
		//로그인 이전 페이지 url 저장하기 ("/qna/list" 대신 해당 url을 넣어주세요!)
		//저는 일일이 넣기 힘들어서 상단 메뉴에 노출되어 있는 /qna/list만 로그인페이지로 리다이렉트하고,
		//나머지 /qna/write, update, detail 은 인터셉터를 유지했습니다...
		//servlet-context에 <interceptor> 부분에 로그인 페이지로 리다이렉트할 페이지만 exclude-mapping해주시고,
		//밑에 있는 로그인 세션 null이면 로그인 페이지로 리다이렉트 해주는 식 넣어주세요!!!!!
		//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		
		if(session.getAttribute("login") == null) {
			if(session.getAttribute("referer")!=null) {
				session.removeAttribute("referer");
			}
			session.setAttribute("referer", "/qna/list");
			return "redirect:/member/login";
		}
		
		//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
		
		
		
		int userNo = (Integer) session.getAttribute("userNo");
		
		Paging paging = qnaService.getPaging(paramData, userNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("paging", paging);
		
		List<Qna> list = qnaService.getQnaList(map);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return null;
	}
	
	@RequestMapping(value="/qna/detail")
	public void qnaDetail(int qnaNo, Model model) {
		Qna qna = qnaService.getQnaDetail(qnaNo);
		QnaComment qnaComment = qnaService.getQnaComment(qnaNo);
		
		model.addAttribute("qna", qna);
		model.addAttribute("qnaComment", qnaComment);
	}
	
	@RequestMapping(value="/qna/write", method=RequestMethod.GET)
	public void qnaWrite(HttpSession session) {	}
	
	@RequestMapping(value="/qna/write", method=RequestMethod.POST)
	public String qnaWriteProc(Qna qna, @RequestParam(value="userNick") String userNick) {
//		logger.info("qna : {}", qna);
		qnaService.setQnaWrite(qna);
		
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value="/qna/update", method=RequestMethod.GET)
	public void qnaUpdate(int qnaNo, Model model) {
		Qna qna = qnaService.getQnaDetail(qnaNo);
		model.addAttribute("qna", qna);
	}
	
	@RequestMapping(value="/qna/update", method=RequestMethod.POST)
	public String qnaUpdateProc(Qna qna, @RequestParam(value="userNick") String userNick) {
//		logger.info("{}",qna);
		qnaService.setQnaUpdate(qna);
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value="/qna/delete")
	public String qnaDelete(int qnaNo) {
		qnaService.setQnaDelete(qnaNo);
		return "redirect:/qna/list";
	}
}
