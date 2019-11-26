package com.kh.finalProject.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheck extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("loginMember")==null) {
			request.setAttribute("msg", "로그인 후 이용가능합니다.");
			request.setAttribute("loc", "/"); // main 화면으로 이동
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			// HandlerMapping에 있는 것만 resolver로 통과한다.
			return false;
		}
		return super.preHandle(request, response, handler);
	}
	
	
	
	
	
	

}
