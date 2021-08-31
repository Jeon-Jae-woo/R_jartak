package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class AdminInterceptor implements HandlerInterceptor {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger가 적용이 안됨 이유는 모름
		logger.info("[ADMIN INTERCEPTOR]");
		
		System.out.println("admin interceptor");
		if(request.getSession().getAttribute("email")!=null && (Integer)request.getSession().getAttribute("level_no")==1 ) {
				return true;
		}
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.info("[INTERCEPTOR]");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		logger.info("[INTERCEPTOR]");
		
	}

}
