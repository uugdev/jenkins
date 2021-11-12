package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.User;
import com.khbill.util.Paging;

public interface AdminUserDao {

	/**
	 * 페이징 처리를 위한 user 전체 갯수 조회
	 * 
	 * @return int
	 */
	public int selectCntAll();

	/**
	 * 전체 회원 정보 조회
	 * 
	 * @param paging
	 * @return List<User>
	 */
	public List<User> selectUserList(Paging paging);

}
