package com.khbill.dao.face;

import com.khbill.dto.Admin;

public interface AdminLoginDao {

	/**
	 * 관리자 로그인 정보와 일치하는 행의 수 조회
	 * 
	 * @param admin - 관리자 로그인 정보
	 * @return 1 or 0
	 */
	public int countLoginInfo(Admin admin);

	/**
	 * 관리자 로그인 성공 시 해당 관리자 정보 조회
	 * 
	 * @param admin - 관리자 로그인 정보
	 * @return Admin
	 */
	public Admin selectAdminByAdminInfo(Admin admin);

}
