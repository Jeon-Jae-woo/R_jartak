package com.trade.controller;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.trade.biz.TradeBiz;
import com.trade.dto.TradeDto;
import com.trade.dto.TradeUpdateDto;

@Controller
public class TradeController {
	Logger logger = LoggerFactory.getLogger(TradeController.class);
	@Autowired
	private TradeBiz tradebiz;
	
	//1 번째 방법
	@RequestMapping("/trade.do")
	public String tread(Model model, @RequestParam("auction_no") int auction_no) {
		logger.info("tradeselect one");
		int selectNo = tradebiz.selectNo(auction_no);
		model.addAttribute("TradeUpdateDto",tradebiz.selectNo(auction_no));
		if(selectNo>0) {
			return "mypage_sale_trading";
		}else {
			return "mypage_sele_end";
		}
		
		
	}
	
//	//2번째 방법
//	//1.auction_no값을 가지고 selectOne처리
//	@RequestMapping("/trade.do")
//	public String trade2(Model model,@RequestParam("auction_no") int auction_no) {
//		TradeDto selectOne = tradebiz.selectOne(auction_no);
//		model.addAttribute("selectOne", selectOne);
//		int seller = TradeBiz.seller(selectOne.getSeller());
//		int bidder = TradeBiz.bidder(selectOne.getBidder_nickname());
//		int status = TradeBiz.status(selectOne.getAuction_no());
//		return null;
//		
//	}
//	
	
	
	
}
