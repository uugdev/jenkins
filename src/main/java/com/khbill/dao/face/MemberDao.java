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

	/**
	 * 
	 * @param user
	 * @return
	 */
	public int checkInfo(User user);

	/**
	 * 
	 * @param user
	 */
	public void insertMember(User user);
	
	/**
	 * 
	 * @param userNick
	 * @return
	 */
	public int selectUserNoByUserNick(String userNick);

}
