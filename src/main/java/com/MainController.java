package com;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("MAIN CONTROLLER");
		return "main";
	}
	
	@RequestMapping("/main2.do")
   	public String main2() {
      logger.info("MAIN CONTROLLER");
  
      return "main2";
	}
	
	
}
