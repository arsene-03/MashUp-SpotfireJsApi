package com.pnd.mashup.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
public class SecurityMemberFailService implements AuthenticationFailureHandler {
    
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("오류 메서드");
		String loginFailMsg = null;
		
		if (exception instanceof AuthenticationServiceException) {
			loginFailMsg = "존재하지 않는 사용자 입니다.";
		} else if(exception instanceof BadCredentialsException) {
			loginFailMsg = "아이디 또는 비밀번호가 틀립니다.";
		}
		request.setAttribute("loginFailMsg", loginFailMsg);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
		dispatcher.forward(request, response);
	}

}
