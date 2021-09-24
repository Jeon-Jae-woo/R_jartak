package com.auction.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.auction.dao.AuctionDao;
import com.auction.dto.AuctionDto;
import com.bids.dao.BidsDao;
import com.bids.dto.BidsDto;
import com.trade.dao.TradeDao;
import com.trade.dto.TradeDto;
import com.util.pagingDto;

@Service
@Transactional
public class AuctionBizImpl implements AuctionBiz {

	@Autowired
	private AuctionDao auctiondao;
	@Autowired
	private pagingDto paging;
	@Autowired
	private BidsDao bidsdao;
	@Autowired
	private TradeDao tradedao;
	
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
	

	//경매 종료 단일(경매 종료에 성공한 경우, 최고 입찰자를 찾아서, 거래 테이블에 등록)
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int TimeOutBiz(Map<String, Object> data) {
		int result = 0;
		try {
			int auction_no = Integer.parseInt(data.get("auction_no").toString());
			result = auctiondao.auctionTimeOver(auction_no);
			
			if(result < 0) {
				throw new Exception("경매 종료 상태 변경 실패");
			}
			AuctionDto auction = auctiondao.selectProductDetail(auction_no);
			
			if(!auction.getHigh_bidder().equals("입찰자가 없습니다")) {
				BidsDto bidsDetail = bidsdao.BidsSelectOne(auction.getHigh_bidder(), auction_no);
				//입찰 번호, 경매 번호, 낙찰자, 판매자, 낙찰 금액
				TradeDto tradeDetail = 
						new TradeDto(bidsDetail.getBid_no(), auction_no, 
								auction.getHigh_bidder(), auction.getNickname(), bidsDetail.getBid_price());
				
				int tradeResult = tradedao.InsertTrade(tradeDetail);
				
				if(tradeResult < 0) {
					throw new Exception("거래 등록 실패");
				}
				
			}
			
		}catch(Exception e) {
			//rollback
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
		}
			
			
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

	

}
