package com.khbill.dao.face;

import java.util.Date;

import com.khbill.dto.Item;

public interface ItemDao {

	/**
	 * item의 투표 기간 종료일을 알아낸다.
	 * 
	 * @param item
	 * @return
	 */
	public Date selectVoteEndByItemNo(Item item);

}
