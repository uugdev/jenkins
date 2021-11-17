package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Item;

public interface AccountService {

	/**
	 * 로그인유저의 결제체크된 아이템리스트
	 * 
	 * @param userNo
	 * @return
	 */
	List<Item> getItemListByLoginUserNo(int userNo);

}
