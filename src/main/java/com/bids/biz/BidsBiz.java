package com.bids.biz;

import java.util.List;

import com.bids.dto.BidsDto;

import java.util.Map;

public interface BidsBiz {
	//경매 입찰
	public String BidProcessBiz(String nickname, Map<String,Object> data);
	
	//마이페이지 구매이력에서 사용
	public List<BidsDto>  bidList(String nickname);

}
