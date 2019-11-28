package com.kh.styleblending.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.styleblending.member.model.vo.Alarm;

@Controller
public class WebSocketHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		
	// 클라이언트와 연결 이후에 실행되는 메서드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessionList.add(session);
		}

		// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			int mno = Integer.parseInt(message.getPayload());
			
			ArrayList<Alarm> list = (ArrayList)sqlSession.selectList("mypageMapper.selectAlarmList", mno);
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			String alarmList = gson.toJson(list);
			/*
			 * data={
			 * 	a:1,
			 * b:2,
			 * c:3,
			 * mno:mno,
			 * }
			 */
			
			for(WebSocketSession sess : sessionList) {
				int sMno = (int)sess.getAttributes().get("sMno");
				if(sMno == Integer.parseInt(message.getPayload())) {
					sess.sendMessage(new TextMessage(alarmList));
				}
			}
			
		}

		// 클라이언트와 연결을 끊었을 때 실행되는 메소드
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			sessionList.remove(session);
		}

}