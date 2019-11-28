package com.kh.styleblending.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class WebSocketInterceptor extends HttpSessionHandshakeInterceptor {
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String,Object> mpAttributes) throws Exception {
		ServletServerHttpRequest sshRequest = (ServletServerHttpRequest)request;
        HttpServletRequest hsrRequest =  sshRequest.getServletRequest();

        int sMno = Integer.parseInt(hsrRequest.getParameter("mno"));
        mpAttributes.put("sMno", sMno);
        return super.beforeHandshake(request, response, wsHandler, mpAttributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex)
	{
		super.afterHandshake(request, response, wsHandler, ex);
	}

}
