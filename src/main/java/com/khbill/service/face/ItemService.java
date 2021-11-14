package com.khbill.service.face;

import java.util.List;

import com.khbill.dto.Item;
import com.khbill.dto.Review;

public interface ItemService {

	/**
	 * itemNo로 askNo를 가져온다
	 * 
	 * @param item - itemNo를 담고 있는 객체
	 * @return askNo
	 */
	public int getAskNoByItemNo(Item item);

	/**
	 * 아이템의 결제 상태를 변경한다
	 * 
	 * 
	 * @param askNo - 문의번호
	 */
	public void setItemStatus(int askNo);

	public List<String> getOkList(List<Item> itemList, List<Review> reviewList);
	

}
