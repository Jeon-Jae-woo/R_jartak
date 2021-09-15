package com.bids.biz;

import java.util.Map;

public interface BidsBiz {
	//경매 입찰
	public String BidProcessBiz(String nickname, Map<String,Object> data);
}
