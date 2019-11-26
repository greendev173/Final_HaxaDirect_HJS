package com.kh.finalProject.subject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.employee.model.vo.Curriculum;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.subject.model.service.SubjectService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService service;
	
	@RequestMapping("/curriculum.hd")
	public String subject(HttpServletRequest req) {
		List<Subject> list1=service.subAllSelect();
		req.setAttribute("list1", list1);
		return "employee/subjectInsert";
	}
	
	@RequestMapping("/selectRoom.hd")
	@ResponseBody
	public String selectRoom(@RequestParam String roomValue) {
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		List<Map> list=service.selectRoom(roomValue);
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			return jsonStr;
	}
	
	 @RequestMapping("/selectTime.hd")
	 @ResponseBody
	 public String selectTime(Subject s) {
		 ObjectMapper mapper=new ObjectMapper();
		 String jsonStr="";

		 List<Subject> list=service.selectTime(s);

		 	try {
				jsonStr=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		return jsonStr;
	 }
	 
	 @RequestMapping("/subInsert.hd")
	 public String subInsert(Subject s,Model model) {
		String[] subT=(String[])s.getSubTime().split(",");
		String subTime=subT[subT.length-1];
		
		List<Subject> list=service.selectTime(s);
		String[] listT;
		String msg="";
		String loc="/curriculum.hd";
		int count=0;
		for(Subject sub : list) {
			listT=sub.getSubTime().split(",");
			for(int i=0; i<listT.length; i++) {
				if(listT[i].equals(subTime)) {
					count++;
				}
			}
		}
		if(count>0) {
			msg="이미 사용중인 강의장입니다.";
		}else {
			try {
				msg="정상적으로 등록되었습니다.";
				int result=service.subInsert(s);
			} catch (Exception e) {
				msg="다시 확인후 작성바랍니다.";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		 return "common/msg";
	 }
	 
	 @RequestMapping("/selectCurri.hd")
	 @ResponseBody
	 public String selectCurri(@RequestParam String deptCode, Model model) {
		 ObjectMapper mapper=new ObjectMapper();
		 String jsonStr="";
		 Map map=new HashMap();
		 List<Map> list=service.selectCurri(deptCode);
		 try {
				jsonStr=mapper.writeValueAsString(list);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		 
		 return jsonStr;
	 }
	 
	 @RequestMapping("/curriSearch.hd")
	 @ResponseBody
	 public String curriSearch(Subject s) {
		 ObjectMapper mapper=new ObjectMapper();
		 List<Subject> list=service.curriSearch(s);
		 String jsonStr="";
		 try {
			 jsonStr=mapper.writeValueAsString(list);
		 }catch(JsonProcessingException e) {
			 e.printStackTrace();
		 }
		 return jsonStr;
	 }
	 
	 @RequestMapping("/subTarget.hd")
	 @ResponseBody
	 public String subTarget(@RequestParam String subName) {
		 Curriculum c=service.subTarget(subName);
		 System.out.println(c);
		 ObjectMapper mapper=new ObjectMapper();
		 String jsonStr="";
		 try {
			 jsonStr=mapper.writeValueAsString(c);
		 }catch(JsonProcessingException e) {
			 e.printStackTrace();
		 }
		 return jsonStr;
		 
	 }
	 
	 
}





















