package com.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.biz.MemberBiz;
import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz memberbiz;
	@Autowired
	private JavaMailSender mailSender;
	
	//로그인 폼 전환
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		logger.info("LOGIN FORM");
		return "login";
	}
	
	//회원가입 폼 전환
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() {
		logger.info("JOIN FORM");
		return "join";
	}
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String insert(MemberDto dto) {
		int res = memberbiz.insert(dto);
		
		if(res>0) {
			return "redirect:loginForm";
		}else {
			return "redirect:joinForm";
		}
		
		
	}
	
	//이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		//화면단에서 넘어온 데이터 확인
		logger.info("이메일 데이터 확인");
		logger.info("이메일 : " + email);
		
		//인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호 : " + checkNum);
	
		//이메일 보내기
		String setFrom = "xian931231@gmail.com";
		String toMail = email;
		String title = "회원가입 인중 이메일 입니다.";
		String content = 
				"저희 홈페이지를 방문해주셔서 감사합니다."+"<br><br>"+
				"인증번호는 "+checkNum+"입니다."+
				"<br>"+"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	
	
		try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
 		
		String num = Integer.toString(checkNum);
	
		return num;
	
	}
	
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> login(HttpSession session, @RequestBody MemberDto reqMember) {
		logger.info("LOGIN CONTROLLER");

		MemberDto loginMember = memberbiz.login(reqMember);
		Map<String,Object> data = new HashMap<String, Object>();
		if(loginMember==null) {
			data.put("status_code", HttpStatus.UNAUTHORIZED); // 401
			return data;
		}else {
			session.setAttribute("email", loginMember.getEmail());
			session.setAttribute("nickname", loginMember.getNickname());
			session.setAttribute("level_no", loginMember.getLevel_no());
			data.put("status_code", HttpStatus.OK); // 200
			return data;
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("LOGOUT");
		session.invalidate();
		return "redirect:main.do";
	}
	
	//로그인 체크(인터셉터 활용)
	@RequestMapping(value="/loginCheck", method=RequestMethod.GET)
	public String loginCheck(Model model) {
		model.addAttribute("msg","로그인 후 이용해주세요");
		model.addAttribute("url","loginForm");
		return "alert";
	}
	
	//마이페이지-회원정보조회
	@RequestMapping("/mypage.do")
	public String mypage(Model model,HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		model.addAttribute("dto",memberbiz.selectOne(email));
		return "mypage_personal_information";
	}
	
	//회원탈퇴페이지
	@RequestMapping("/mypage_quit.do")
	public String mypage_quit(Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		MemberDto dto = memberbiz.selectOne(email);
		model.addAttribute("dto",dto);
		
		return "mypage_personal_quit";
	}
	//회원정보삭제(탈퇴)
	@ResponseBody
	@RequestMapping(value="/deleteInfo.do",method=RequestMethod.GET)
	public String delete(HttpSession session,HttpServletRequest request) {
		logger.info("delete res");
		session = request.getSession();
		String email = (String)session.getAttribute("email");
		System.out.println("email="+email);
		int res = memberbiz.deleteInfo(email);
		String resultMsg="";
		if(res>0) {
			resultMsg="<script>alert('SUCCESS!');location.href='logout'</script>";
		}else {
			resultMsg="<script>alert('FAIL!');location.href='mypage_quit.do?'</script>";

		}
		
		return resultMsg;
	}
	
	@RequestMapping("/mypage_msg_receive.do")
	public String msg_receive() {
		return "mypage_message_receive";
	}
	
	@RequestMapping("/mypage_msg_send.do")
	public String msg_send() {
		return "mypage_message_send";
	}
	
	

	@RequestMapping("/mypage_interest.do")
	public String mypage_interest() {
		
		return "mypage_interest";
		
	}
	
	@RequestMapping("/mypage_bankAcc.do")
	public String mypage_bankAcc() {
		
		return "mypage_bankAccount";
		
	}
	
	@RequestMapping("/mypage_buy.do")
	public String mypage_buy(String money) {
		if(money.equals("end")) {
			return "mypage_buy_end";
		}else if(money.equals("failure")) {
			return "mypage_buy_failure";
		}else if(money.equals("ing")) {
			return "mypage_buy_ing";
		}else{
			return "mypage_buy_trading";
		}
	}
	
	@RequestMapping("/mypage_sale.do")
	public String mypage_sale(String sale) {
		if(sale.equals("end")) {
			return "mypage_sale_end";
		}else if(sale.equals("failure")) {
			return "mypage_sale_failure";
		}else if(sale.equals("ing")) {
			return "mypage_sale_ing";
		}else{
			return "mypage_sale_trading";
		}
	}
	
	@RequestMapping("/mypage_emoney.do")
	public String mypage_emoney(String emoney) {
		if(emoney.equals("main")) {
			return "mypage_emoney_main";
		}else if(emoney.equals("charge")) {
			return "mypage_emoney_charge";
		}else {
			return "mypage_emoney_withdrawal";
		}
	}
	
	@RequestMapping("/mypage_grade.do")
	public String mypage_grade(String grade,HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		MemberDto dto = memberbiz.selectOne(email);
		
		int rank_no = dto.getRank_no();
		
		MemberRankDto rankDto = memberbiz.rank(rank_no);
		
		String rank = (String)rankDto.getRank_name();
		
		System.out.println(rank);
		
		model.addAttribute("rankDto", rankDto);
		model.addAttribute("dto", dto);
		
		return "mypage_grade";
	}
	
	//회원정보변경
	@ResponseBody
	@RequestMapping(value="/update_info.do")
	public String update_Info(MemberDto dto,Model model) {
		logger.info("update res");
		int res = memberbiz.updateInfo(dto);
		String resultMsg = "";
		if(res>0) {
			resultMsg = "<script>alert('SUCCESS!');location.href='mypage.do?email="+dto.getEmail()+"'</script>";
		}else {
			resultMsg = "<script>alert('FAIL!');location.href='mypage.do?email="+dto.getEmail()+"'</script>";
		}
		return resultMsg;
	}
	

	
	
	
	
	
	
	
	
	
}
