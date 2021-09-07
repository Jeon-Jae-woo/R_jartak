package com.auction.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.auction.dao.AuctionDao;
import com.auction.dto.AuctionDto;

@Service
@Transactional
public class AuctionBizImpl implements AuctionBiz {

	@Autowired
	private AuctionDao auctiondao;
	
	@Override
	public int insertProductBiz(AuctionDto auctiondto) {
		int result = auctiondao.InsertProduct(auctiondto);
		return result;
	}

	@Override
	public List<AuctionDto> selectProductListBiz(int pageNum, int auctionType) {
		List<AuctionDto> productList = auctiondao.selectProductList(pageNum, auctionType);
		return productList;
	}

}
