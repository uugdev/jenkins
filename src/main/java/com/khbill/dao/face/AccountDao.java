package com.khbill.dao.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Item;
import com.khbill.dto.User;

public interface AccountDao {

	
	/**
	 * 
	 * itemStatus가 y인 유저 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public List<Item> selectItemStatus(int userNo);

	/**
	 * 유저번호로 유저조회
	 * 
	 * @param userNo
	 * @return
	 */
	public User selectUserByUserNo(int userNo);

	/**
	 * 지출가능금액 업데이트
	 * 
	 * @param user
	 */
	public void updateExtraMoney(User user);

	/**
	 * 이번년도 월별지출액 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public List<HashMap<String,Object>> selectItemSum(int userNo);
	
	
	/**
	 * 유저의 이번달 지출액 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public int selectItemListMonSumUserNo(int userNo);


	/**
	 * 유저가 이번달 구매한 아이템
	 * 
	 * @param userNo
	 * @return
	 */
	public List<Item> selectUserMonItemList(int userNo);

	/**
	 * 유저의 지난달 총 지출액
	 * 
	 * @param userNo
	 * @return
	 */
	public int selectLastMonItemSum(int userNo);

}
