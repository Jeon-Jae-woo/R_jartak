package com.bids.biz;

import java.util.List;

import com.bids.dto.BidsDto;

public interface BidsBiz {
	public List<BidsDto>  bidList(String nickname);
}
