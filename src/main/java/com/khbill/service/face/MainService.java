package com.khbill.service.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.khbill.dto.Notice;
import com.khbill.dto.User;

public interface MainService {
	
	/**
	 * 포인트가 높은 유저 10명 조회
	 * 
	 * @return 포인트가 높은 유저 10명
	 */
	public List<User> getUserPointListTen();
	
	/**
	 * 최신 공지사항 6개 조회
	 * 
	 * @return 최신 공지사항 6개
	 */
	public List<Notice> getNoticeListSix();

	/**
	 * 사용 가능한 금액과 퍼센트 조회
	 * 
	 * @param session - session 유저 번호
	 * @return 사용 가능한 금액과 퍼센트
	 */
	public Map<String, Integer> getAvailableAmountAndPercent(HttpSession session);
	
	/**
	 * 퍼센트에 해당하는 메인 멘트 리스트 조회
	 * 
	 * @param persent - 퍼센트
	 * @return 메인 멘트 리스트
	 */
	public List<String> getMainment(Integer persent);

}
