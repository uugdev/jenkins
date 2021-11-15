package com.khbill.dao.face;

import com.khbill.dto.User;

public interface MemberDao {

	/**
	 * 입력된 정보와 정확히 일치하는 행의 수 구하기
	 * 
	 * @param user - 로그인 정보
	 * @return 1 or 0
	 */
	public int countLoginInfo(User user);

	/**
	 * 로그인 정보 확인 후 해당 로그인 정보로 회원 정보 불러오기
	 * 
	 * @param user - 로그인 정보
	 * @return User
	 */
	public User selectUserByUserInfo(User user);

	/**
	 * 임시 임시 아이디랑 닉네임 나눠야함
	 * @param user
	 * @return
	 */
	public int checkInfo(User user);

	/**
	 * 회원가입 정보를 DB에 저장
	 * 
	 * @param user - 회원가입 정보
	 */
	public void insertMember(User user);
	
	/**
	 * 회원 닉네임으로 회원 번호 불러오기
	 * 
	 * @param userNick - 회원 닉네임
	 * @return int userNo
	 */
	public int selectUserNoByUserNick(String userNick);

	/**
	 * 중복되는 아이디 확인
	 * 
	 * @param user - 회원가입 정보
	 * @return 0이어야 정상
	 */
	public int countUserIdDupl(User user);

	/**
	 * 중복되는 닉네임 확인
	 * 
	 * @param user - 회원가입 정보
	 * @return 0이어야 정상
	 */
	public int countUserNickDupl(User user);

	/**
	 * 유저 번호로 유저 닉네임을 찾는다
	 * 
	 * @param - 유저 번호
	 * @return 유저 닉네임
	 */
	public String selectUserNickByUserNo(int msgUserNo);
	
	/**
	 * 유저 번호로 유저 객체 찾기
	 * 
	 * @param userNo
	 * @return 유저
	 */
	public User selectUserByUserNo(int userNo);

	/**
	 * 회원 정보 수정하기
	 * 
	 * @param user
	 */
	public void updateUserInfo(User user);

	/**
	 * 회원 정보 삭제하기
	 * 
	 * @param userNo
	 */
	public void deleteUser(int userNo);

	/**
	 * 닉네임으로 조회한 회원 명수 반환
	 * 
	 * @param userNick
	 * @return 1 - 존재하는 회원, 0 - 존재하지 않는 회원
	 */
	public int selectUserCntByUserNick(String userNick);
	
	

}
