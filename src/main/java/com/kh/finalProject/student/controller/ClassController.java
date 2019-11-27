package com.kh.finalProject.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.student.model.service.StudentService1;
import com.kh.finalProject.student.model.vo.Student;



@Controller
public class ClassController {


	@Autowired
	private StudentService1 service;
	
	
	@RequestMapping("/student/applyClass.hd")
	public String selectAllClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage)
	{
		
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		int numPerPage=10;
		int count=0;
		List<Map> list=service.selectAllClass(stuId,cPage,numPerPage);
		Map stuInfo=service.selectStuInfo(stuId);
		int totalData = service.countAllClass(stuId);
		/* int applyClassNow =service.alpplyClassNow() */
		Map planList=service.selectPlan();
		
		
		
		m.addAttribute("stuInfo",stuInfo);
		m.addAttribute("applyDay",planList);
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/student/applyClass.hd"));
		
		return "student/applyClass";

	}
	
	
	@RequestMapping(value = "/student/selectClass.hd", method = RequestMethod.POST)
	public String selectClass(HttpSession session, Model m,HttpServletRequest req, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		Student loginMember=(Student)session.getAttribute("loginMember");
		
		String stuId=loginMember.getStuNo();
		
		
		
		int numPerPage=10;
		Map<String,Object> param = new HashMap();
		param.put("stuId",stuId);
		param.put("chk_isu",req.getParameter("chk_isu"));
		param.put("chk_school",req.getParameter("chk_school"));
		param.put("chk_dept",req.getParameter("chk_dept"));
		param.put("chk_year",req.getParameter("chk_year"));
		param.put("chk_sem",req.getParameter("chk_sem"));
		param.put("chk_subName",req.getParameter("chk_subName"));
		List<Map> list=service.selectClass(param,cPage,numPerPage);
		int totalData = service.countSelectClass(param);
		Map stuInfo=service.selectStuInfo(stuId);
		m.addAttribute("stuInfo",stuInfo);
		Map planList=service.selectPlan();
		m.addAttribute("applyDay",planList);
		
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/student/selectClass.hd"));
		return "student/applyClass";
		
	}
	
	@RequestMapping(value = "/student/profEval.hd", method = RequestMethod.POST)
	public String profEval(HttpServletRequest req,Model m)
	{
	
			
		  String[] profInfo=req.getParameter("profEvalForm").split(",");
		  String subName=profInfo[0];
		  String profId=profInfo[1];
		  String semester=profInfo[2];
		  String[] sem1 =semester.split("-");
		  System.out.println(sem1[0]);
		  System.out.println(sem1[1]);
		  int year=Integer.parseInt(sem1[0]);
		  int sem=Integer.parseInt(sem1[1]);
		  if(sem==2) {
			  sem=sem-1;
			  semester=year+"-"+sem;
		  }else if(sem==1) {
			  year=year-1;
			  sem=sem+1;
			  semester=year+"-"+sem;
		  }

		  Map<String,Object> param=new HashMap();
		  param.put("subName", subName);
		  param.put("profId", profId);
		  param.put("semester", semester);
		  
		  Map<String,Object> reprofInfo=service.selectProfInfo(param);
		  
		  List<Map> list=service.selectProfEval(param);
		  System.out.println(list);
		  if(!list.isEmpty()) {
		  double averPoint=service.averPoint(param);
		  m.addAttribute("averPoint",averPoint);
		  }
		  m.addAttribute("list",list);
		  m.addAttribute("profInfo",reprofInfo);
	
		  
		  
		return "student/profEval";

	}
	
	@RequestMapping(value = "/student/applyClass.hd", method = RequestMethod.POST)
	
	public ModelAndView applyClass(HttpServletRequest req,Model m)
	{
		ModelAndView mv=new ModelAndView();
		Map<String,String> param=new HashMap();
		String value=req.getParameter("value");
		String[] value1=value.split(",");
		String stuId=value1[0];
		String subSeq=value1[1];


		Map<String,String> capacity=service.capacityNow(subSeq);
	
		String capacityNow=String.valueOf(capacity.get("PRE_CAPA"));
		String capacityFull=String.valueOf(capacity.get("CAPACITY"));
		int capacityNowi=Integer.parseInt(capacityNow);
		int capacityFulli=Integer.parseInt(capacityFull);
		
		
		if((capacityNowi-capacityFulli)!=0) {
			param.put("stuId",stuId);
			param.put("subSeq",subSeq);
			int result=service.applyClass(param);
			int result1=service.updatePreCapa(param);
			mv.addObject("capacityOk","정상처리됐습니다");
			mv.setViewName("jsonView");
			
		}else {
			
			mv.addObject("capacityFull","수업 최대인원 초과입니다");
			mv.setViewName("jsonView");
		
		}

		
		return mv;
		
	}
	@RequestMapping(value = "/student/cancelClass.hd", method = RequestMethod.POST)
	public String cancelClass(HttpServletRequest req,Model m)
	{
		Map param=new HashMap();
		String value=req.getParameter("value");
		String[] value1=value.split(",");
		String stuId=value1[0];
		String subSeq=value1[1];
		
		
	
		param.put("stuId",stuId);
		param.put("subSeq",subSeq);
		int result=service.cancelClass(param);
		int result1=service.updatePreCapaCancel(param);
		
		
		return "student/applyClass";
	
	}

	@RequestMapping("/student/myClassInfo.hd")
	public String selectMyApplyClass(HttpSession session,Model m,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage
			, HttpServletRequest req) {
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		
		
		
		
		int numPerPage=10;
		int count=0;
		List<Map> list=service.myApplyClass(stuId,cPage,numPerPage);
		Map planList=service.selectPlan();
		int totalData = service.countMyApplyClass(stuId);
	
		
		m.addAttribute("applyDay",planList);
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/student/applyClass.hd"));
		return "student/myApplyClass";
	
	}
	
	@RequestMapping(value = "/student/cancelMyClass.hd", method = RequestMethod.POST)
	public String cancelMyClass(HttpServletRequest req,Model m)
	{
		Map param=new HashMap();
		String value=req.getParameter("value");
		String[] value1=value.split(",");
		String stuId=value1[0];
		String subSeq=value1[1];
		
		param.put("stuId",stuId);
		param.put("subSeq",subSeq);
		int result=service.cancelClass(param);
		int result1=service.updatePreCapaCancel(param);
		
		return "student/myApplyClass";
	
	}
	
	@RequestMapping(value = "/student/selectMyClass.hd", method = RequestMethod.POST)
	public String selectMyClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		Student loginMember=(Student)session.getAttribute("loginMember");
		String stuId=loginMember.getStuNo();
		
		
		int numPerPage=10;
		Map<String,Object> param = new HashMap();
		param.put("stuId",stuId);
		param.put("chk_isu",req.getParameter("chk_isu"));
		param.put("chk_school",req.getParameter("chk_school"));
		param.put("chk_dept",req.getParameter("chk_dept"));
		param.put("chk_year",req.getParameter("chk_year"));
		param.put("chk_sem",req.getParameter("chk_sem"));
		param.put("chk_subName",req.getParameter("chk_subName"));
		List<Map> list=service.selectMyClass(param,cPage,numPerPage);
		Map planList=service.selectPlan();
		int totalData = service.countSelectMyClass(param);
		
		m.addAttribute("applyDay",planList);
		m.addAttribute("list",list);
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/student/selectClass.hd"));
		return "student/myApplyClass";
		
	}
	
	
	
	
}
	

