package com.bids.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bids.dto.BidsDto;

@Repository
public class BidsDaoImpl implements BidsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BidsDto> bidList(String nickname) {
		List<BidsDto> bidList = new ArrayList<BidsDto>();
		try {
			bidList = sqlSession.selectList(NAMESPACE+"selectList",nickname);
		} catch (Exception e) {
			System.out.println("BidDto불러오기 실패...");
			e.printStackTrace();
		}
		return bidList;
	}

}
