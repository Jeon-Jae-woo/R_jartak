package com.socket.server;
 
import java.util.ArrayList;

import java.util.List;



import org.springframework.stereotype.Component;

import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler{
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
}