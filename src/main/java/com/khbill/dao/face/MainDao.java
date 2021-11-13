package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Notice;
import com.khbill.dto.User;

public interface MainDao {
	
	/**
	 * 포인트가 높은 유저 10명 조회
	 * 
	 * @return 포인트가 높은 유저 10명
	 */
	public List<User> selectUserInfoOrderByPoint();
	
	/**
	 * 최신 공지사항 6개 조회
	 * 
	 * @return 최신 공지사항 6개
	 */
	public List<Notice> selectNoticeListSix();
	
	/**
	 * 유저 번호에 해당하는 지출 가능 금액 조회
	 * 
	 * @param userNo - 유저번호
	 * @return 지출 가능 금액
	 */
	public int selectExtraMoneyByUserNo(int userNo);
	
	/**
	 * 유저 번호에 해당하는 유저의 결제 여부가 y인 상품 가격의 총합 조회
	 * 
	 * @param userNo - 유저 번호
	 * @return 결제 여부가 y인 상품 가격의 총합
	 */
	public int selectItemListCheckStatusByUserNo(int userNo);
	
	/**
	 * 퍼센트로에 해당하는 메인 멘트 리스트 조회
	 * 
	 * @param persent - 퍼센트
	 * @return 메인 멘트 리스트
	 */
	public List<String> selectMainment(Integer persent);

}
