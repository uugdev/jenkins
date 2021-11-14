package com.khbill.service.face;

import com.khbill.dto.Item;

public interface ItemService {

	/**
	 * item의 결제 상태를 변경한다
	 * 
	 * @param item - 변경할 아이템
	 */
	public void setItemStatus(Item item);
	

}
