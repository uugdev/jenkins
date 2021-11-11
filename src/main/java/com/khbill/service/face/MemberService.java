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

	/**
	 * 
	 * @param user
	 * @return
	 */
	public boolean checkInfo(User user);

	/**
	 * 
	 * @param user
	 */
	public void join(User user);
	
	/**
	 * 
	 * 
	 * @param userNick
	 */
	public int getUserNo(String userNick);

}
