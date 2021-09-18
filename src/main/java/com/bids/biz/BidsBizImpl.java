package com.bids.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bids.dao.BidsDao;
import com.bids.dto.BidsDto;

@Service
public class BidsBizImpl implements BidsBiz {

	@Autowired
	private BidsDao dao;

	@Override
	public List<BidsDto>  bidList(String nickname) {
		return dao.bidList(nickname);
	}

}
