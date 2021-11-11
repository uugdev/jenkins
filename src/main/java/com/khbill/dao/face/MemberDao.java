package com.khbill.dao.face;

import com.khbill.dto.User;

public interface MemberDao {

	/**
	 * 
	 * @param user
	 * @return
	 */
	public int countLoginInfo(User user);

	/**
	 * 
	 * @param user
	 * @return
	 */
	public User selectUserByUserInfo(User user);

}
