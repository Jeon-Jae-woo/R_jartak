package com.bids.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.auction.dao.AuctionDao;
import com.auction.dto.AuctionDto;
import com.bids.dao.BidsDao;
import com.bids.dto.BidsDto;
import com.member.dao.MemberDao;
import com.member.dto.MemberDto;

@Service
@Transactional(rollbackFor=Exception.class)
public class BidsBizImpl implements BidsBiz {
	
	@Autowired
	private MemberDao memberdao;
	@Autowired
	private AuctionDao auctiondao;
	@Autowired
	private BidsDao bidsdao;
	
	@Override
	public String BidProcessBiz(String nickname, Map<String, Object> data){
		//data : auction_no, bid_price, current_price
		
		//유저 정보 반환
		MemberDto bidMember = memberdao.selectOneNick(nickname);
		if(bidMember == null) {
			return "회원 정보가 존재하지 않습니다";
		}
		//종료 시간 업데이트
		int auction_no = Integer.parseInt(data.get("auction_no").toString());
		int updateCheck = auctiondao.auctionTimeOver(auction_no);
		if(updateCheck < 0) {
			return "다시 시도해 주십시오";
		}
		//경매 정보 반환
		AuctionDto auction = auctiondao.selectProductDetail(auction_no);
		if(auction.getAuction_status_no() != 1) {
			return "종료된 경매입니다";
		}
		//프론트에서 받은, 현재 금액과 실제 디비에 있는 현재 금액이 맞지 않는 경우
		int current_price = (int) data.get("current_price");
		if(current_price != auction.getCurrent_price()) {
			return "다시 시도해 주십시오";
		}
		
		//입찰자, 경매자 체크
		if(nickname.equals(auction.getNickname())) {
			return "입찰할 수 없습니다";
		}
		
		//트랜잭션 처리 필요
		//입찰 정보 반환, 입찰이 있는 경우, 없는 경우, 회원 및 amount 업데이트
		String result = "서버 에러 발생";
		try {
			BidsDto bidsDetail = bidsdao.BidsSelectOne(nickname, auction_no);
			int bidPrice = Integer.parseInt(data.get("bid_price").toString()); 
			
			int memberUpdateResult = 0;
			int bidsResult = 0;
			
			//최고 입찰자랑 현재 입찰하는 사람이 같은 경우
			if(nickname.equals(auction.getHigh_bidder())) {
				BidsDto highBid = bidsdao.BidsSelectOne(auction.getHigh_bidder(), auction_no);
				int compareAmount = bidPrice - highBid.getBid_price();
				if(compareAmount > bidMember.getAmount()) {
					return "보유 금액이 부족합니다";
				}
				memberUpdateResult = bidsdao.MinusMemberAmountUpdate(nickname, compareAmount);
				
			}else {
				if(bidPrice > bidMember.getAmount()) {
					return "보유 금액이 부족합니다";
				}
				memberUpdateResult = bidsdao.MinusMemberAmountUpdate(nickname, bidPrice);
				//기존 경매 최고 입찰자 정보 가져오고, 돈 반환
				if(!auction.getHigh_bidder().equals("입찰자가 없습니다")) {
					BidsDto highBid = bidsdao.BidsSelectOne(auction.getHigh_bidder(), auction_no);
					memberUpdateResult = bidsdao.PlusMemberAmountUpdate(highBid.getNickname(), highBid.getBid_price());
					if(memberUpdateResult < 0) {
						throw new Exception("최고 입찰자 금액  반환 업데이트 실패");
					}
				}
			}
			
			
			if(memberUpdateResult < 0) {
				throw new Exception("회원 금액 업데이트 실패");
			}
			//최초 입찰 등록
			if(bidsDetail == null) {
				bidsResult = bidsdao.BidsFirstRegister(nickname, auction_no, bidPrice);
			}
			//입찰 업데이트
			else {
				bidsResult = bidsdao.BidsRegister(nickname, auction_no, bidPrice);
			}
			
			//경매 현재가격 및 최고 입찰자 업데이트
			int auctionUpdateResult = bidsdao.AuctionCurrentUpdate(auction_no, bidPrice, nickname);
			if(auctionUpdateResult < 0) {
				throw new Exception("경매 가격 및 최고 입찰자 업데이트 실패");
			}
			
			//입찰 성공 및 실패
			if(bidsResult < 0) {
				throw new Exception("입찰에 실패했습니다");
			}else {
				result = "입찰했습니다";
			}
		}catch(Exception e) {
			//rollback
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return result;
	}
	
	

}
