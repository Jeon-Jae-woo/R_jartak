package com.socket.server;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.basic.dao.MessageMapper;


public class EchoHandler extends TextWebSocketHandler {
    
    
    private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    @Autowired
    private MessageMapper messageMapper;
    
    
//    Map<String,WebSocketSession> us ers = new HashMap<>();
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		/* 해당 부분이 수정되야할 부분 messageMapper쪽 에러.. */
		
		  String user_name = searchUserName(session); sessionList.add(session);
		  session.sendMessage(new
		  TextMessage("recMs :"+messageMapper.countMessageView(user_name)));
		 
		 
    	
    	/*
		 * String user_name = searchUserName(session); for(WebSocketSession sess :
		 * sessionList) { sess.sendMessage(new TextMessage(user_name+"님이 접속했습니다.")); }
		 * sessionList.add(session);
		 */
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String user_name= searchUserName(session);
 
        
//        //사용자가 접속중인지 아닌지
//        WebSocketSession chatwritingSession =users.get("user_name");
//        if(chatwritingSession != null) {
//            TextMessage textMessage = new TextMessage(user_name+ " 님이 메세지를 보냈습니다.");
//            chatwritingSession.sendMessage(textMessage);
//        }
        for(WebSocketSession sess: sessionList) {
            sess.sendMessage(new TextMessage(user_name+": "+message.getPayload()));
        }
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String user_name = searchUserName(session);
        System.out.println("연결 끊어짐");
        for(WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage(user_name+"님의 연결이 끊어졌습니다."));
        }
        sessionList.remove(session);
    }
    
    public String searchUserName(WebSocketSession session)throws Exception {
        String user_name;
        Map<String, Object> map;
        map = session.getAttributes();
        user_name = (String) map.get("user_name");
        return user_name;
    }
    
    
    @RequestMapping("/message_test.do")
    public String message_test() {
    	return "message_test";
    }
    
    
}

