package com.khbill.service.face;

import com.khbill.dto.Admin;

public interface AdminLoginService {

	/**
	 * 관리자 로그인
	 * 
	 * @param admin - 로그인 정보
	 * @return true/false
	 */
	public boolean isLogin(Admin admin);

	/**
	 * 로그인 성공 시 관리자 정보 가져오기
	 * 
	 * @param admin - 로그인 정보
	 * @return Admin
	 */
	public Admin getAdminInfo(Admin admin);


}
