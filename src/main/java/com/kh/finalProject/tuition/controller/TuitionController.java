package com.kh.finalProject.tuition.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.tuition.model.service.TuitionService;
import com.kh.finalProject.tuition.model.vo.Tuition;

@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService service;
	
	@RequestMapping("/tuition.hd")
	public String tuition(Model model) {
		List<Tuition> list=service.tuitionList();
		model.addAttribute("list",list);
		return "admin/tuitionInsert";
	}
	
	@RequestMapping("/tuitonInsert.hd")
	public String tutionInsert(
			@RequestParam(value="tuiYear",required=false,defaultValue="1") String tuiYear,
			@RequestParam(value="deptCode",required=false,defaultValue="1") String deptCode,
			@RequestParam(value="tuiPay",required=false,defaultValue="1") String tuiPay,
			@RequestParam(value="tuiPayDate",required=false,defaultValue="1") String tuiPayDate,
			Model model
			) {
		Tuition t=new Tuition();
		t.setTuiYear(tuiYear);
		t.setDeptCode(deptCode);
		t.setTuiPay(tuiPay);
		t.setTuiPayDate(tuiPayDate);
		String msg="";
		String loc="/tuition.hd";
		Tuition tui=service.selectOne(tuiYear,deptCode);
		
		if(tui!=null) {
			if(!(tui.getTuiYear()==t.getTuiYear() && tui.getDeptCode()==t.getDeptCode())) {
					msg="이미 등록되어 있습니다.";
			}else {
				try {
					int result=service.insertTuition(t);
					msg="정상적으로 등록 되었습니다.";
				} catch (Exception e) {
					msg="빈칸없이 작성바랍니다.";
				}
			}
		}else {
			try {
				int result=service.insertTuition(t);
				msg="정상적으로 등록 되었습니다.";
			} catch (Exception e) {
				msg="빈칸없이 작성바랍니다.";
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/tuitionList.hd")
	@ResponseBody
	public String tuitionList(@RequestParam String tuiYear, Model model) {
		List<Tuition> list=service.tuitionList(tuiYear);
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonStr;
	}
	
	@RequestMapping("/tuitionUpdate.hd")
	public String tuitionUpdate(
			@RequestParam String tuiYear,
			@RequestParam String deptCode,
			@RequestParam String tuiPay,
			Model model
			) {
		Tuition t=new Tuition();
		t.setTuiYear(tuiYear);
		t.setDeptCode(deptCode);
		t.setTuiPay(tuiPay);
		String msg="";
		String loc="/tuition.hd";
		try {
			int result = service.tuitionUpdate(t);			
			msg="정상적으로 수정되었습니다.";
		}catch(Exception e) {
			msg="다시 수정해주세요.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);

		return "common/msg";
	}

}































