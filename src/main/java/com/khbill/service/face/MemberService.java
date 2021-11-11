package com.khbill.service.face;

import com.khbill.dto.User;

public interface MemberService {

	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean isLogin(User user);

	/**
	 * 
	 * @param user
	 * @return
	 */
	public User getUserInfo(User user);

}
