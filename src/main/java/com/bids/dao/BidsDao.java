package com.bids.dao;

import java.util.List;

import com.bids.dto.BidsDto;

public interface BidsDao {
	String NAMESPACE ="bids.";
	
	public List<BidsDto> bidList(String nickname);
	
}
