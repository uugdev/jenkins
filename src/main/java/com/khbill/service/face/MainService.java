package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.khbill.dto.Notice;

public interface MainService {
	
	/**
	 * 포인트가 높은 유저 10명 조회
	 * 
	 * @return 포인트가 높은 유저 10명
	 */
	public List<HashMap<String, String>>getUserPointListTen();
	
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
	 * @return 랜덤 메인 멘트
	 */
	public String getMainment(Integer persent);
	
	/**
	 * 질문 게시판에서 인기 게시글 조회
	 * 
	 * @return 인기 게시글 리스트
	 */
    public List<Object> getPopularBoard();
    
    /**
     * 결제 여부가 y인 상품정보 및 날짜를 회원번호로 조회
     * 
     * @return
     */
    public List<Object> getBuyItemList(HttpSession session);

}
