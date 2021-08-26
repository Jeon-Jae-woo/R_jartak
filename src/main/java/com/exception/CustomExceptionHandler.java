package com.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class CustomExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(CustomExceptionHandler.class);
	
	//500
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String Allexception(Exception e, WebRequest request) {
		logger.error("----------[ERROR]------------");
		logger.error("URL : " + request.getDescription(false));
		logger.error("Error Name : " + e.toString());
		logger.error("-----------------------------");
		//로그 추적으로 사용함(빨간 글씨 출력)
		e.printStackTrace();
		return "errorPage500";
	}
	
	//404
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String notFound(Exception e, WebRequest request) {
		logger.error("----------[ERROR]------------");
		logger.error("URL : " + request.getDescription(false));
		logger.error("Error Name : " + e.toString());
		logger.error("-----------------------------");
		//404 에러기 때문에 로그 추적은 하지 않음
		return "errorPage404";
	}
	
	
}
