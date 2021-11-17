package com.khbill.dao.face;

import java.util.List;

import com.khbill.dto.Item;

public interface AccountDao {

	
	/**
	 * 
	 * itemStatus가 y인 유저 조회
	 * 
	 * @param userNo
	 * @return
	 */
	public List<Item> selectItemStatus(int userNo);

}
