package com.khbill.service.face;

import java.util.HashMap;
import java.util.List;

import com.khbill.dto.Item;
import com.khbill.util.Paging;

public interface ItemService {
	
	/**
	 * 아이템리스트를 가져온다
	 * 
	 * @param map - 유저 번호, 페이징이 담겨있는 hashMap객체
	 * @return
	 */
	public List<HashMap<String, Object>> getItemList(HashMap<String, Object> map);

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
	 * @param askNo - 문의번호
	 */
	public void setItemStatus(int askNo);

	/**
	 * 페이징
	 * 
	 * @param paramData
	 * @param userNo
	 * @return 페이징 객체
	 */
	public Paging getPaging(Paging paramData, int userNo);

}
