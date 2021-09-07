package com.auction.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.auction.biz.AuctionBiz;
import com.auction.dto.AuctionDto;
import com.util.UtilFileUpload;

@Controller
public class AuctionController {
	
	Logger logger = LoggerFactory.getLogger(AuctionController.class);
	
	@Autowired
	private UtilFileUpload utilFileUpload;
	@Autowired
	private AuctionBiz auctionbiz;
	
	
	@RequestMapping("/test2")
	public String test() {
		return "home";
	}
	
	
	@RequestMapping("/productDetail")
	public String product() {
		return "product";
	}
	
	@RequestMapping("/productlist")
	public String list(Model model, @RequestParam("pageNum")int pageNum, @RequestParam("auctionType")int auctionType) {
		
		List<AuctionDto> productList = auctionbiz.selectProductListBiz(pageNum, auctionType);
		
		model.addAttribute("productList", productList);
		
		return "productList";
	}
	
	//경매 등록 폼
	@RequestMapping(value = "/productAddForm.log", method = RequestMethod.GET)
	public String productAddForm() {
		logger.info("[PRODUCT FORM CONTROLLER]");
		return "productAdd";
	}
	
	//경매 등록
	@RequestMapping(value = "/productAdd.log", method = RequestMethod.POST)
	public String productAdd(Model model, MultipartHttpServletRequest request, 
			@RequestParam("uploadImg")MultipartFile uploadFile,
			@RequestParam("title")String title, @RequestParam("productName")String productName,
			@RequestParam("tempContent")String content, @RequestParam("productPrice")int productPrice,
			@RequestParam("biddingUnit")int biddingUnit, @RequestParam("auctionType")int auctionType,
			@RequestParam("endDate")String endDate, @RequestParam("endTime")String endTime
			) {
		logger.info("[PRODUCT ADD CONTROLLER]");
		//닉네임
		String nickname = (String)request.getSession().getAttribute("nickname");
		//날짜 계산
		String dateTime = endDate + " " + endTime + ":00";
		//파일업로드
		String fileName = utilFileUpload.fileUpload(request, uploadFile, "/resources/product/");
		//상품 dto
		AuctionDto auction = new AuctionDto();
		auction.setAuction_title(title);
		auction.setProduct_name(productName);
		auction.setAuction_content(content);
		auction.setProduct_price(productPrice);
		auction.setBidding_unit(biddingUnit);
		auction.setAuction_type_no(auctionType);
		//닉네임, 날짜 계산, 파일 이름
		auction.setNickname(nickname);
		auction.setEndDateStr(dateTime);
		auction.setProduct_img(fileName);
		
		
		int result = auctionbiz.insertProductBiz(auction);
		
		if(result>0) {
			model.addAttribute("msg","경매가 등록되었습니다");
			model.addAttribute("url", "productlist");
			return "alert";
		}else {
			model.addAttribute("msg","경매 등록에 실패했습니다");
			model.addAttribute("url", "productAddForm.log");
			return "alert";
		}
		
	}
	
	
	@RequestMapping("/streaming")
	public String streaming() {
		return "streaming";
	}
	
	
	
}
