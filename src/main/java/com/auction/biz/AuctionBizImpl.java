package com.auction.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.auction.dao.AuctionDao;
import com.auction.dto.AuctionDto;
import com.auction.dto.auction_interestedDto;
import com.util.pagingDto;

@Service
@Transactional
public class AuctionBizImpl implements AuctionBiz {

	@Autowired
	private AuctionDao auctiondao;
	@Autowired
	private pagingDto paging;
	
	
	@Override
	public int insertProductBiz(AuctionDto auctiondto) {
		int result = auctiondao.InsertProduct(auctiondto);
		return result;
	}

	@Override
	public List<AuctionDto> selectProductListBiz(int pageNum, int auctionType) {
		List<AuctionDto> productList = null;
		productList = auctiondao.selectProductList(pageNum, auctionType);	
		return productList;
	}

	
	@Override
	public AuctionDto productDetailBiz(int auction_no) {
		AuctionDto productDetail = auctiondao.selectProductDetail(auction_no);
		return productDetail;
	}

	@Override
	public int TimeOutListBiz() {
		int result = auctiondao.auctionTimeOverList();
		return result;
	}

	@Override
	public int TimeOutBiz(Map<String, Object> data) {
		int auction_no = Integer.parseInt(data.get("auction_no").toString());
		int result = auctiondao.auctionTimeOver(auction_no);
		return result;
	}

	@Override
	public pagingDto productListCountBiz(int pageNum, int auctionType) {
		paging.setPageNum(pageNum);
		int size = 0;
		size = auctiondao.productListCount(auctionType);
		paging.setTotalCount(size);
		paging.pagination();
		return paging;
		
	}
	

	@Override
	public int insertInterested(auction_interestedDto dto) {
		
		return auctiondao.insertInterested(dto);
	}

	@Override
	public List<AuctionDto> selectInterestedListBiz(int pageNum,String buy_nickname) {
		return auctiondao.selectInterestedList(pageNum,buy_nickname);
	}

	@Override
	public pagingDto interestedListCountBiz(int pageNum) {
		paging.setPageNum(pageNum);
		int size = 0;
		size = auctiondao.interestedListCount();
		paging.setTotalCount(size);
		paging.pagination();
		return paging;
		
		}

	@Override
	public auction_interestedDto interestedListChk(int auction_no, String buy_nickname) {
		return auctiondao.interestedListChk(auction_no, buy_nickname);
	}
	
	public List<AuctionDto> MyProductListBiz(Map<String,int[]> map){
		List<AuctionDto> productList = null;
		productList = auctiondao.MyProductList(map);
		return productList;
	}

}
