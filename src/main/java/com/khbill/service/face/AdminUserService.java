package com.khbill.service.face;

import java.util.Date;
import java.util.List;

import com.khbill.dto.User;
import com.khbill.util.Paging;

public interface AdminUserService {

	/**
	 * 페이징 정보 불러오기
	 * 
	 * @param paramData
	 * @return
	 */
	public Paging getPaging(Paging paramData);

	/**
	 * 회원 목록 전체 조회
	 * 
	 * @param paging - 페이징 정보
	 * @return List<User>
	 */
	public List<User> getUserlist(Paging paging);

	/**
	 * 회원 선택 삭제
	 * 
	 * @param userNo - 선택된 회원 번호
	 */
	public void setUserDelete(int i);

	/**
	 * 회원 로그인 불가 일수 설정
	 * 
	 * @param userNo - 회원번호
	 * @param days - 오늘로부터 며칠까지 못 들어오게 할건지
	 * @return Date
	 */
	public Date setUnablePeriod(int userNo, int days);

	/**
	 * 로그인 차단 취소
	 * 
	 * @param userNo - 회원 번호
	 * @return String -result
	 */
	public String setUnablePeriodNull(int userNo);

}
