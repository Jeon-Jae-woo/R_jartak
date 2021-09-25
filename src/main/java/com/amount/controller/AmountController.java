package com.amount.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amount.biz.AmountBiz;
import com.amount.dto.WithdrawalDto;
import com.util.pagingDto;


@Controller
public class AmountController {
	
	Logger logger = LoggerFactory.getLogger(AmountController.class);
	
	@Autowired
	AmountBiz amountbiz;
	
	//관리자, 출금 리스트 목록
	@RequestMapping(value="/adminWithdrawList")
	public String adminWithdrawList(Model model,@RequestParam("pageNum")int pageNum) {
		
		List<WithdrawalDto> withList = amountbiz.WithdrawalList(pageNum);
		pagingDto paging = amountbiz.WithdrawalListCount(pageNum);
		
		model.addAttribute("withList", withList);
		model.addAttribute("paging", paging);
		
		return "adminWithdrawBoard";
	}
	
	//출금 요청하면 상태 4가지 - 대기중, 승인, 거절
	
	//출금 상태 변경
	@RequestMapping(value="/adminWithdrawPC", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> adminWithdrawPC(@RequestBody Map<String,Object> withInfo){
		int result = amountbiz.WithdrawalProcessing(withInfo);
		
		Map<String,Object> data = new HashMap<String, Object>();
		
		if(result>0) {
			data.put("status", HttpStatus.OK);
		}else {
			data.put("status", HttpStatus.BAD_REQUEST);
		}
		
		return data;
	}
	
	//마이페이지에서의 출금요청
	@ResponseBody
	@RequestMapping(value="/insertWithdrawal")
	public String insertwithdrawal(String withdrawal_amount,String account_no,String nickname) {
		System.out.println("도착~");
		String[] contents= new String[]{withdrawal_amount,account_no,nickname};
		System.out.println(contents[0] +"\n"+contents[1]+"\n"+contents[2]);
		int res = amountbiz.insertWithdrawal(contents);
		String resultMsg = "";
		if(res>0) {
			resultMsg = "<script>alert('SUCCESS!');location.href='mypage_emoney.do?emoney=withdrawal'</script>";
		}else {
			resultMsg = "<script>alert('FAIL!');location.href='mypage_emoney.do?emoney=withdrawal'</script>";
		}
		return resultMsg;
	}
	
	
	
	
	
}
