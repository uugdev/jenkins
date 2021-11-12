package com.khbill.service.face;

import com.khbill.dto.User;

public interface MemberService {

	/**
	 * 로그인 정보와 회원 정보 일치하는지 확인하기
	 * 
	 * @param user - 로그인 정보
	 * @return true - 일치하는 회원 정보 1개 있음, false - 일치하는 회원 정보가 없거나 1개 이상
	 */
	public boolean isLogin(User user);

	/**
	 * 로그인 정보로 세션에 저장할 회원 정보 불러오기
	 * 
	 * @param user - 로그인 정보
	 * @return - User 
	 */
	public User getUserInfo(User user);

	/**
	 * 아이디 중복확인과 닉네임 중복확인을 한 후 회원가입 정보 저장
	 * 
	 * @param user - 회원가입 정보
	 */
	public void join(User user);
	
	/**
	 * 회원 닉네임으로 회원 번호 불러오기
	 * 
	 * @param userNick - 회원 닉네임
	 * @return int userNo
	 */
	public int getUserNo(String userNick);

	/**
	 * 아이디 중복 확인
	 * 
	 * @param user - 회원가입 정보
	 * @return boolean
	 */
	public boolean checkUserId(User user);

	/**
	 * 닉네임 중복 확인
	 * 
	 * @param user - 회원가입 정보
	 * @return boolean
	 */
	public boolean checkUserNick(User user);

	/**
	 * 유저 번호로 닉네임을 구한다
	 * 
	 * @param msgUserNo
	 * @return 유저 닉네임
	 */
	public String getUserNickByUserNo(int msgUserNo);



}
