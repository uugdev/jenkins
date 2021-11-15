package com.khbill.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbill.dao.face.MainDao;
import com.khbill.dto.Ask;
import com.khbill.dto.Notice;
import com.khbill.dto.User;
import com.khbill.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Autowired MainDao mainDao;

	@Override
	public List<User> getUserPointListTen() {
		return mainDao.selectUserInfoOrderByPoint();
	}

	@Override
	public List<Notice> getNoticeListSix() {
		return mainDao.selectNoticeListSix();
	}

	@Override
	public Map<String, Integer> getAvailableAmountAndPercent(HttpSession session) {
		
		//조회 결과
		Map<String, Integer> resultMap = new HashMap<>();
		
		//유저 번호
		int userNo = (int) session.getAttribute("userNo");
		
		//지출 가능 금액, //결제 여부가 y인 상품 가격의 총합
		int extraMoney = mainDao.selectExtraMoneyByUserNo(userNo);
		int totalPrice = mainDao.selectItemListCheckStatusByUserNo(userNo);
		
		logger.info("extraMoney - {}", extraMoney);
		logger.info("totalPrice - {}", totalPrice);
		
		//아낀 돈, //지출 퍼센트
		int saveMoney = 0;
		int percent = -1; //지출 가능 금액을 설정해주세요 출력
		
		//지출 가능 금액을 설정했을 경우, 아낀 돈 계산
		if( extraMoney != 0 ) {
			saveMoney = extraMoney - totalPrice;
		}
		
		//지출 가능 금액, 결제 여부가 y인 상품 가격의 총합이 0이 아닐 경우, 지출 퍼센트 계산
		if( extraMoney != 0 && totalPrice != 0 ) {
			percent = (totalPrice / extraMoney) * 100;
			
			//지출 가능 금액보다 결제를 많이 했을 경우
			if( percent > 100) {
				percent = 100;
			}
		}
		
		//지출 가능 금액을 설정했지만, 결제 여부가 없을 때
		if( extraMoney != 0 && totalPrice == 0 ) {
			percent = -2;
		}
		
		logger.info("percent - {}", percent);
		
		resultMap.put("saveMoney", saveMoney);
		resultMap.put("percent", percent);
		
		return resultMap;
	}

	@Override
	public List<String> getMainment(Integer persent) {
		return mainDao.selectMainment(persent);
	}

	@Override
    public List<Object> getPopularBoard() {
        return mainDao.selectAskListOrderByHit();
    }

    @Override
    public List<Object> getBuyItemList(HttpSession session) {
        
        //유저 번호
        int userNo = (int) session.getAttribute("userNo");
        
        return mainDao.selectBuyItemList(userNo);
    }
}
