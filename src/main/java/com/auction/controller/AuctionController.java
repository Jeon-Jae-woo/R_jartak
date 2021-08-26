package com.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuctionController {
	
	@RequestMapping("/test2")
	public String test() {
		return "home";
	}
	
	
	@RequestMapping("/product")
	public String product() {
		return "product";
	}
	
	@RequestMapping("/productAdd")
	public String productAdd() {
		return "productAdd";
	}
	
	
	
}
