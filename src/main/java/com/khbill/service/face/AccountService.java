package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Item;
import com.khbill.dto.User;

public interface AccountService {

	/**
	 * 로그인유저의 결제체크된 아이템리스트
	 * 
	 * @param userNo
	 * @return
	 */
	public List<Item> getItemListByLoginUserNo(int userNo);

	/**
	 * 유저의 지출가능금액 수정
	 * 
	 * @param userNo
	 * @param money
	 */
	public void setUpdateExtraMoney(int userNo, int money);

	/**
	 * 유저번호로 유저조회
	 * 
	 * @param userNo
	 * @return
	 */
	public User getUserInfo(int userNo);

	/**
	 * 유저의 결제체크아이템 가격의 합(달별)
	 * 
	 * @param userNo
	 * @return
	 */
	public List<HashMap<String,Object>> getUserItemSum(int userNo);

	
	/**
	 * 로그인유저의 이번달 지출금액의합
	 * 
	 * @param userNo
	 * @return
	 */
	public int getitemSumMon(int userNo);

	
	
	/**
	 * 로그인유저의 이번달 결제체크된 아이템리스트
	 * 
	 * @param userNo
	 * @return
	 */
	public List<Item> getItemListByMon(int userNo);

	
	/**
	 * 
	 * 전달과 이번달 지출액 비교
	 * 
	 * @param userNo
	 * @return
	 */
	public int getCompareItemSum(int userNo);
	
}
