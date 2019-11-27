package com.kh.finalProject.professor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService3;
import com.kh.finalProject.professor.model.vo.Professor;

@Controller
public class ProfessorController3 {
	// 학과생조회

	@Autowired
	ProfessorService3 service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
	@RequestMapping("/prof/editClassPoint.hd")	
	public String gradeEdit(HttpSession session, Model m,HttpServletRequest req, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {	
		
		Professor p=(Professor)session.getAttribute("loginMember");
		int numPerPage=10;
	
		
		/*Map<String,Object> param=new HashMap();*/
		String profId=p.getProfId();
		
		/*String profPw=p.getProfPw();*/
		/* param.put("profId",profId); */
		/*param.put("profPw",profPw);*/
		List<Map> list = service.gradeEdit(profId,cPage,numPerPage);
		List<Map> studyList=service.studyList(profId);
		int totalData = service.countAllStudent(profId);
		
		
		
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/editClassPoint.hd"));
		m.addAttribute("studyList",studyList);
		m.addAttribute("list",list);
	
		
		return "professor/stu_edit_classResult";
	
	}	
	
	@RequestMapping("/prof/choiceClass.hd")	
	public String choiceClass(HttpSession session, Model m,HttpServletRequest req,@RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		Map<String,Object> param = new HashMap();
		Professor p=(Professor)session.getAttribute("loginMember");
		String profId=p.getProfId();
		int numPerPage=10;
		
		String subSeq=req.getParameter("selectSubListhd");
		String semester=req.getParameter("semChoicehd");
		if(req.getParameter("selectListNum")!=null) {
		numPerPage=Integer.parseInt(req.getParameter("selectListNum"));
		}
		param.put("subSeq",subSeq);
		param.put("semester",semester);
		param.put("profId",profId);
		
		List<Map> list = service.choiceClass(param,cPage,numPerPage);
		List<Map> studyList=service.studyList(profId);
		int totalData = service.countChoiceStudent(param);
		
		
		m.addAttribute("totalCount",totalData);
		m.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/choiceClass.hd"));
		m.addAttribute("studyList",studyList);
		m.addAttribute("list",list);
	
		return"professor/stu_edit_classResult";
	}

	@RequestMapping("/prof/stuInsertScore.hd")	
	public String stuInsertScore(HttpSession session, Model m,HttpServletRequest req) {	
		Map<String,Object> param=new HashMap();	
		String value=req.getParameter("value");
	
		String[] value1=value.split(",");
		String stuId=value1[0];
		String subSeq=value1[1];
		String profId=value1[2];
		String yearSem=value1[3];
		String subCode=value1[4];
		String subName=value1[5];
		String compPt=value1[6];
		param.put("profId",profId);
		param.put("stuId",stuId);
		param.put("subSeq",subSeq);
		param.put("yearSem",yearSem);
		param.put("subCode",subCode);
		param.put("subName",subName);
		param.put("compPt",compPt);
		
		Map<String,Object> flag = service.gradeFlag(param);
		/* List<String,Object> stugrade=service. */
		
		if(flag==null) {
			
			int result1=service.firstGrade(param);
			
		}
	
		 Map<String,Object> result=service.stuInsertScore(param);
		 Map<String,Object> gradeNow=service.stuGrade(param);
		 Map<String,Object> howManyStudent=service.stuMany(param);
		 int totalGradeNull=service.totalGradeNull(param);
		 
		 m.addAttribute("totalGradeNull",totalGradeNull);
		 m.addAttribute("gradeNow",gradeNow);
		 m.addAttribute("howManyStudent",howManyStudent);
		
	
		 m.addAttribute("result",result);
	
		
		
		return "professor/stuInsertScore";
		
		
	}
	
	
	@RequestMapping(value = "/prof/updatePoint.hd", method = RequestMethod.POST)
	@ResponseBody
	public String updatePoint(HttpSession session, Model m,HttpServletRequest req) {
		
		Map<String,Object> param=new HashMap();
			String pointInfo=req.getParameter("value");
			String[] pointInfo1=pointInfo.split(",");
			
			String updateCol=pointInfo1[0];
			String subSeq=pointInfo1[1];
			String stuId=pointInfo1[2];
			String updatePoint=pointInfo1[3];
			
			param.put("updateCol",updateCol);
			param.put("subSeq",subSeq);
			param.put("stuId",stuId);
			param.put("updatePoint",updatePoint);
			
		
			int result = service.updatePoint(param);
			
	
		
		
		return "";
		
		
	}
	@RequestMapping(value = "/prof/checkInPw.hd", method = RequestMethod.POST)
	@ResponseBody
	public String checkInPw(HttpSession session, Model m,HttpServletRequest req) {
	
			Professor p=(Professor)session.getAttribute("loginMember");
			String pwNow=req.getParameter("pwNow");
			String profId=p.getProfId();
			String flag ="";
			
			Map<String, Object> profPw=service.checkInPw(profId);
		
			String profPw1=(String)profPw.get("PROF_PW");
	
			String pwck="false";
			
			if(pwEncoder.matches(pwNow,profPw1)) {
				
				flag="true";
				
			}else {	flag= "false";
			
			}
			
			
		
			
			
			
			
			return flag;
			
	
			
	}
	
}
	
	
