package com.kh.finalProject.req.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.req.model.service.ReqService;
import com.kh.finalProject.req.model.vo.Req;

@Controller
public class ReqController {
	
	@Autowired
	private ReqService service;
	
	@RequestMapping("/req.hd")
	public String insertReq(Req req, Model model) {
		String msg="";
		String loc="";
		try {
			if(!req.getToName().equals("EA000000000")) {
				msg="건의사항 접수가 완료되었습니다.";
				loc="/main.hd";	
			}else {				
				msg="답변이 전달 되었습니다.";
				loc="/reqList.hd";
			}
			int result=service.insertReq(req);			
		}catch(Exception e) {
			msg="다시 작성해주세요.";
			loc="/main.hd";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/reqList.hd")
	public String reqList() {
		return "req/reqList";
	}

	
	@RequestMapping(value="/ajax/reqList.hd")
	@ResponseBody
	public String reqList(Model model, @RequestParam(value="index", required=false, defaultValue="0" ) int index, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage,
			HttpServletResponse res) {
		int numPerPage=5;
		ObjectMapper mapper=new ObjectMapper();
		List<Req> allList=service.reqList(index, cPage, numPerPage);
		String jsonStr="";
		int totalData=service.selectReqCount(index);
		Map map=new HashMap();
		map.put("allList",allList);
		map.put("pageBar",PageFactory.getAjaxPageBar(index,totalData,cPage,numPerPage,"/finalProject/ajax/reqList.hd"));
		
		try {
			jsonStr=mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			return jsonStr;
	}
	
	@RequestMapping("/reqOne.hd")
	public String reqOne(@RequestParam int reqNo, Model model) {
		Req req=service.reqOne(reqNo);
		model.addAttribute("reqOne",req);
		return "req/reqOne";
	}
	
	@RequestMapping("/answerUpdate.hd")
	public String answerUpdate(Req req, @RequestParam int reqNo, Model model) {
		int answerUpdate=service.answerUpdate(reqNo);
		String msg="";
		if(answerUpdate > 0) {
			msg="처리 완료 되었습니다.";
		}else {
			msg="실패 하였습니다.";
		}
		String loc="/reqOne.hd?reqNo="+reqNo;
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		model.addAttribute("reqOne",req);
		
		return "common/msg";
	}
	
	@RequestMapping("/reqAnswer.hd")
	public String reqAnswerView(@RequestParam String userId,Model model) {
		Boolean flag=true;
		List<Req> sendList=null;
		List<Req> answerList=null;

		sendList=service.reqSendList(userId,flag);
		flag=false;
		answerList=service.reqSendList(userId,flag);

		model.addAttribute("sendList", sendList);
		model.addAttribute("answerList", answerList);
		
		return "req/reqAnswerList";
	}
	
	@RequestMapping("/reqAnswerOne.hd")
	public String reqAnswerOne(@RequestParam int reqNo, Model model) {
		Req req=service.reqOne(reqNo);
		model.addAttribute("reqOne",req);
		return "req/reqAnswerOne";
	}
	

}
























