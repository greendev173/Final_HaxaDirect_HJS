package com.kh.finalProject.school.controller;

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
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.school.model.service.SchoolService;
import com.kh.finalProject.school.model.vo.College;

@Controller
public class SchoolController {
	
	
	@Autowired 
	private SchoolService service;
	 
	
	@RequestMapping("/school.hd")
	public String school(Model model, HttpServletRequest req, @RequestParam(value="cPage",required=false,defaultValue="1")int cPage) {
		int numPerPage=4;

		int colCount=service.colCount();
		List<College> colList=service.colList();
		List<Map> deptList=service.deptList(cPage,numPerPage);
		int totalData=service.deptCount();
		
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData,cPage,numPerPage,req.getContextPath()+"/school.hd"));
		
		model.addAttribute("colCount",colCount);
		model.addAttribute("deptCount",totalData);
		model.addAttribute("colList",colList);
		model.addAttribute("deptList",deptList);
		return"employee/school";
	}
	
	@RequestMapping("/colInsert.hd")
	public String colInsert(College c, Model model) {
		
		List<College> colList=service.colList1();
		
		char alpa=colList.get(colList.size()-1).getColCode().charAt(0);
		int ialpa=(int)alpa+1;
		char calpa = (char)ialpa;
		c.setColCode(String.valueOf(calpa));
		
		int result=service.colInsert(c);
		String msg="정상적으로 등록되었습니다.";
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/deptInsert.hd")
	public String deptList(Department d,Model model) {
		String colCode=d.getColCode();
		List<Department> list=service.deptList(colCode);
		String strDeptCode="";
		if(list!=null && !list.isEmpty()) {	
			String str=list.get(list.size()-1).getDeptCode();
			String deptStr= str.substring(str.length()-2, str.length());
			int intDeptCode=(Integer.parseInt(deptStr))+1;
			strDeptCode=String.valueOf(intDeptCode);
			
			if(strDeptCode.length()==1) {
				strDeptCode=colCode+"0"+strDeptCode;
			}else {
				strDeptCode=colCode+strDeptCode;
			}
		}else{
			strDeptCode=colCode+"01";
		}
			
		d.setDeptCode(strDeptCode);
		String msg="";
		try {
			int result=service.deptInsert(d);			
			msg="정상적으로 등록되었습니다.";
		}catch(Exception e) {
			msg="학부를 선택해주세요.";
		}
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/selectColSerch.hd")
	@ResponseBody
	public String selectColSerch(@RequestParam String colCode) {
		List<Map> list=service.deptList1(colCode);
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}
	
	@RequestMapping("/deleteCol.hd")
	public String deleteCol(@RequestParam String colCode,Model model) {
		
		int result=service.deleteCol(colCode);
		
		String msg="정상적으로 폐설되었습니다.";
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/deleteDept.hd")
	public String deleteDept(@RequestParam String deptCode,Model model) {
		int result=service.deleteDept(deptCode);
		String msg="정상적으로 폐설되었습니다.";
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/updateCol.hd")
	public String updateCol(College c,Model model) {
		int result=service.updateCol(c);
		String msg="정상적으로 수정되었습니다.";
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/updateDept.hd")
	public String updateDept(Department d,Model model) {
		int result=service.updateDept(d);
		String msg="정상적으로 수정되었습니다.";
		String loc="/school.hd";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/subRoom.hd")
	public String subRoomPage() {
		return "employee/subRoomList";
	}
	
	@RequestMapping("subRoomUse.hd")
	@ResponseBody
	public String subRoomUseList(Subject s) {
		List<Map> list=service.subRoomUseList(s);
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}
	
}

































