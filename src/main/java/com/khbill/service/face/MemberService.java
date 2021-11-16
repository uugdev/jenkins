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
	 * @param userId - 회원가입 시 입력한 아이디
	 * @return int
	 */
	public int checkUserId(String userId);

	/**
	 * 닉네임 중복 확인
	 * 
	 * @param userNick - 회원가입 시 입력한 닉네임
	 * @return int
	 */
	public int checkUserNick(String userNick);

	/**
	 * 유저 번호로 닉네임을 구한다
	 * 
	 * @param msgUserNo
	 * @return 유저 닉네임
	 */
	public String getUserNickByUserNo(int msgUserNo);

	/**
	 * 세션에 있는 유저번호로 유저 가져오기
	 * 
	 * @param userNo
	 * @return 유저 객체
	 */
	public User getUserByUserNo(int userNo);

	/**
	 * 회원정보를 수정한다
	 * 
	 * @param user
	 */
	public void setUserUpdate(User user);
	
	/**
	 * 회원정보를 삭제한다
	 * 
	 * @param userNo
	 */
	public void setUserDelete(int userNo);
	
	/**
	 * 닉네임에 맞는 사용자가 있는지 조회한다
	 * 
	 * @param userNick
	 * @return 존재하면 1 없으면 0
	 */
	public int checkUserExists(String userNick);



}
