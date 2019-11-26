package com.kh.finalProject.beforeStudent.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;
import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.common.encrypt.Sha256Encrypto;

@Controller
public class BeforeStuController {

	@Autowired
	private MyEncrypt enc;
	@Autowired
	private BeforeStuService service;
	
	
	@RequestMapping("/selectColList.do")
	@ResponseBody
	public Map selectColList() {
		Map map = new HashedMap();
		List<Map> list = service.selectColList();
		map.put("list", list);
		return map;
	}
	
	
	@RequestMapping("/selectDeptList.do")
	@ResponseBody
	public Map selectDeptList(@RequestParam String result) {
		Map map = new HashedMap();
		List<Map> list = service.selectDeptList(result);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/beforeStudent/enroll.hd")
	public String insertBeforeStudent(BeforeStu s, Model model) {
		String msg ="";
		String loc = "/";
		try {
			s.setBeforeNo(enc.encrypt(s.getBeforeNo()));
			int result = service.insertBeforeStudent(s);
			msg = "입학 신청 완료!";
		}catch(Exception e){
			msg = "입학 신청 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
}
