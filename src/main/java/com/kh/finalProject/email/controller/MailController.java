package com.kh.finalProject.email.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.email.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;
	
	@RequestMapping(value="/email.do")
	@ResponseBody
	public Map checkEmail() {
		Map m = new HashMap();
		int ran = new Random().nextInt(900000) + 100000;
		m.put("random",ran);
		return m;
	}
	
	@RequestMapping(value="/login/createEmailCheck.do")
	@ResponseBody
	public String createEmailCheck(@RequestParam String userEmail, @RequestParam String random, HttpServletRequest request) {
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject ="KH대학교 입학 신청 이메일 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 "+ authCode + "입니다.");
		boolean flag = mailService.send(subject, sb.toString(), "lgwan840@gmail.com", userEmail)?true:false;
		return String.valueOf(flag);
	}
	
	@ResponseBody
	public String createEmailCheck1(@RequestParam String userEmail, @RequestParam String random, HttpServletRequest request) {
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject ="KH대학교 비밀번호 찾기 이메일 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 "+ authCode + "입니다.");
		boolean flag = mailService.send(subject, sb.toString(), "lgwan840@gmail.com", userEmail)?true:false;
		return String.valueOf(flag);
	}
	
	@RequestMapping(value="/emailAuth.do")
	@ResponseBody
	public String emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session) {
		String originaljoinCode = (String)session.getAttribute("authCode");
		String originalRandom = (String)session.getAttribute("random");
		if(originaljoinCode.equals(authCode) && originalRandom.equals(random)) {
			return "complete";
		}
			return "false";
	}
	

	public void forSendEmail(String userEmail, String title, String msg,  HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String subject = title;
		StringBuilder sb = new StringBuilder();
		sb.append(msg);
		mailService.send(subject, sb.toString(), "lgwan840@gmail.com", userEmail);
	}
	
	
	
	
}
