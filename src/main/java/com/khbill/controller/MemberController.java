package com.khbill.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khbill.dto.User;
import com.khbill.service.face.MemberService;


@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login( ) {	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(User user, HttpSession session, 
			@RequestParam(value="kakaoEmail", required=false) String kakaoEmail, 
			@RequestParam(value="kakaoGender", required=false) String kakaoGender, 
			Model model, HttpServletResponse resp) {
//		logger.info("{}", user);
//		logger.info("kakao email, gender : {}, {}", kakaoEmail, kakaoGender);
		
		if( user.getUserId() != null && !"".equals(user.getUserId())){
			boolean login  = memberService.isLogin(user);
			if( login == true ) {
				logger.info("Login Successed");
				
				User userInfo = memberService.getUserInfo(user);
				session.setAttribute("login", true);
				session.setAttribute("userNick", userInfo.getUserNick());
				session.setAttribute("userNo", userInfo.getUserNo());
				
				return "redirect:/main";
			} else {
				logger.info("Login Failed");
				session.invalidate();

				resp.setHeader("Content-Type", "text/html;charset=UTF-8");
				try {
					PrintWriter out = resp.getWriter();
					out.append("<script>");
					out.append("alert('로그인을 실패하였습니다. 로그인 정보를 다시 확인해주세요.'); location.href='/member/login';");
					out.append("</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
				return null;
			}

		} else {
			int check = memberService.checkUserMail(kakaoEmail);
			
			if(check == 0) {//해당 이메일로 회원가입한 이력이 없는 경우
				model.addAttribute("kakaoEmail", kakaoEmail);
				model.addAttribute("kakaoGender", kakaoGender);
				return "redirect:/member/kakaojoin";
			} else {
				
				User kuser = memberService.getUserByUserMail(kakaoEmail);
				logger.info("kuser.split : {}", kuser.getUserId().split("-")[0]);
				
				if(kuser.getUserId().split("-")[0].equals("kakao")) {
					logger.info("kakao로 시작하는 아이디가 맞음!");
					session.setAttribute("login", true);
					session.setAttribute("userNick", kuser.getUserNick());
					session.setAttribute("userNo", kuser.getUserNo());
					
					return "redirect:/main";
				} else {
					logger.info("kakao로 시작하는 아이디가 아님!");
					resp.setHeader("Content-Type", "text/html;charset=UTF-8");
					try {
						PrintWriter out = resp.getWriter();
						out.append("<script>");
						out.append("alert('입력하신 이메일은 이미 가입 이력이 있습니다. 일반 로그인을 이용해주세요.'); location.href='/member/login';");
						out.append("</script>");
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null;
				}
				
				
			}
		}
	}
	
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session ) {
		logger.info("/member/logout");
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(User user) {
//		logger.info("/member/join [POST]");
//		logger.info("{}", user);
		
		memberService.join(user);
		return "redirect:/member/joinSuccess";
	
	}
	
	@RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck( @RequestParam(value="userId") String userId ) {
		logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+userId);
        int cnt = memberService.checkUserId(userId);
        logger.info("확인 결과:"+cnt);
        return cnt;
	}

	@RequestMapping(value="/member/nickCheck", method=RequestMethod.POST)
	@ResponseBody
	public int nickCheck( @RequestParam(value="userNick") String userNick ) {
		logger.info("userNickCheck 진입");
		logger.info("전달받은 Nick:"+userNick);
		int cnt = memberService.checkUserNick(userNick);
		logger.info("확인 결과:"+cnt);
		return cnt;
	}

	@RequestMapping(value="/member/mailCheck", method=RequestMethod.POST)
	@ResponseBody
	public int mailCheck( @RequestParam(value="userMail") String userMail ) {
		int cnt = memberService.checkUserMail(userMail);
		logger.info("확인 결과:"+cnt);
		return cnt;
	}
	
	@RequestMapping(value="/member/kakaojoin", method=RequestMethod.GET)
	public void kakaojoin(String kakaoEmail, String kakaoGender, Model model) {
		model.addAttribute("kakaoEmail", kakaoEmail);
		model.addAttribute("kakaoGender", kakaoGender);
	}
	
	@RequestMapping(value="/member/kakaojoin", method=RequestMethod.POST)
	public String kakaojoinProc(User user) {
//		logger.info("user info : {}", user);
		memberService.joinKakao(user);
		return "redirect:/member/joinSuccess";
	}
	
	@RequestMapping(value="/member/joinSuccess")
	public void joinSuccess() {	}
}
