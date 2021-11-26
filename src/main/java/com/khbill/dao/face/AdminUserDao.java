package com.khbill.dao.face;

import java.util.Date;
import java.util.List;

import com.khbill.dto.User;
import com.khbill.util.Paging;

public interface AdminUserDao {

	/**
	 * 페이징 처리를 위한 user 전체 갯수 조회
	 * 
	 * @param search - 검색어
	 * @return int
	 */
	public int selectCntAll(Paging paramData);

	/**
	 * 전체 회원 정보 조회
	 * 
	 * @param paging
	 * @return List<User>
	 */
	public List<User> selectUserList(Paging paging);

	/**
	 * 선택한 회원 정보 삭제
	 * @param i - 회원번호
	 */
	public void deleteUser(int i);

	/**
	 * 지정한 일수만큼 로그인 불가 설정
	 * 
	 * @param userNo - 회원 번호
	 * @param days - 일
	 */
	public void updateUnablePeriod(int param2, int param1);

	/**
	 * 로그인 불가 날 조회
	 * 
	 * @param userNo - 회원번호
	 * @return
	 */
	public Date selectUnablePeriod(int userNo);

	/**
	 * 로그인 불가 취소
	 * 
	 * @param userNo - 회원 번호
	 */
	public void updateUnablePeriodNull(int userNo);

}
