package com.khbill.service.face;

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

}
