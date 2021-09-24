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

@Controller
public class TradeController {
	Logger logger = LoggerFactory.getLogger(TradeController.class);
	@Autowired
	private TradeBiz tradebiz;
	
	
	@RequestMapping("/trade.do")
	public String tread() {
		logger.info("trade");
		
		return "trade";
	}
	
	@RequestMapping(value = "/sellerTradeList", method = RequestMethod.GET)
	public String sellerTradeList(Model model,@RequestParam("nickname")String nickname) {
		
		return null;
	}
	
	
	
	
}
