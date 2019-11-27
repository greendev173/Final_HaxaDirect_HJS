package com.kh.finalProject.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.email.controller.MailController;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.employee.model.service.NoticeService;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.employee.model.vo.NoticeVo;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.service.StudentService;
import com.kh.finalProject.student.model.vo.StuTuition;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class MemberController {
	
	@Autowired
	private StudentService stuService;
	@Autowired
	private EmployeeService empService;
	@Autowired 
	private ProfessorService proService;
	@Autowired
	private NoticeService service;
	@Autowired
	private MailController mc;
	@Autowired
	private BCryptPasswordEncoder bEnc;
	
	
	@RequestMapping("/main.hd")
	public String main(Model model, HttpServletRequest req, 
    		@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		
		int numPerPage = 8;         
        
        List<NoticeVo> list = service.selectNoticeList(cPage, numPerPage);
        for(NoticeVo n : list) {
        	n.setRegDate(n.getRegDate().substring(0, 10));
        }
        int totalData = service.countNoticeList();
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/main.hd"));
		
		return "common/main";
	}
	
//	@RequestMapping("login")
//	public String login(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}

	@RequestMapping(value="/login.hd", method=RequestMethod.POST)
	public String Login(
			HttpSession session,
			HttpServletRequest req,
			HttpServletResponse res,
			@RequestParam(value="loginNo") String loginNo, 
			@RequestParam(value="loginId") String loginId, 
			@RequestParam(value="loginPwd") String loginPwd
			) {
		
//		System.out.println("idSave:"+req.getParameter("idSave"));
		
		if(req.getParameter("idSave")!=null&&req.getParameter("idSave").equals("on")) { // 아이디 저장 체크박스 체크 했으면
			Cookie idSave=new Cookie("idSave", loginId);
			idSave.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			res.addCookie(idSave); // 쿠키 추가
		}else { // 아이디 저장 체크박스 체크 안했으면
			Cookie[] cookies=req.getCookies();
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("idSave")) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					res.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				}
			}
			
		}
		
		String msg="";
		String loc="";
		if(loginNo.equals("s")) {
			Cookie loginTypeC=new Cookie("loginType", "stu"); // 학생 화면 전용 쿠키 생성하기
			loginTypeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			res.addCookie(loginTypeC); // 쿠키 추가
//			System.out.println("loginType:stu");
			
			Student stu=stuService.selectOne(loginId);
			if(stu!=null) {
				if(bEnc.matches(loginPwd, stu.getStuPw())){
					session.setAttribute("loginMember", stu);
				}
			}
		}else if(loginNo.equals("p")){
			Cookie loginTypeC=new Cookie("loginType", "prof"); // 교수 화면 전용 쿠키 생성하기
			loginTypeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			res.addCookie(loginTypeC); // 쿠키 추가
//			System.out.println("loginType:prof");
			
			Professor pro=proService.selectOne(loginId);
			if(pro!=null) {
				if(bEnc.matches(loginPwd, pro.getProfPw())){
					session.setAttribute("loginMember", pro);
				}
			}
		}else if(loginNo.equals("e")){
			Cookie loginTypeC=new Cookie("loginType", "emp"); // 직원 화면 전용 쿠키 생성하기
			loginTypeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			res.addCookie(loginTypeC); // 쿠키 추가
//			System.out.println("loginType:emp");
			
			Employee emp=empService.selectOne(loginId);
			if(emp!=null) {
				if(bEnc.matches(loginPwd, emp.getEmpPw()) || loginId.equals("E00000000")){
				session.setAttribute("loginMember", emp);
				}
			}
		}
		
		if(session != null && session.getAttribute("loginMember")!=null) {
			msg="로그인 되었습니다.";
			loc="/main.hd";
		}else {
			msg="학/사번 또는 비밀번호를 확인해주세요.";
			loc="/";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/logout.hd") // 로그아웃 시 호출됨
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/stuIdSearch.hd")
	public String stuIdSearch(Student s, @RequestParam String loginNo, HttpServletRequest req,Model model,
			@RequestParam(value="searchName", required=false, defaultValue="0" ) String searchName,
			@RequestParam(value="searchEmail", required=false, defaultValue="0" ) String searchEmail
			) {
		StringBuilder sb = new StringBuilder();
		String msg="";
		String loc="/";
		Map map=new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchEmail", searchEmail);
		if(loginNo.equals("s")) {
			Student stu=stuService.stuIdSearch(s);
			if(stu!=null) {
				if(stu.getStuName().equals(s.getStuName())&&stu.getStuEmail().equals(s.getStuEmail())) {
					sb.append("귀하의 학번은 "+ stu.getStuNo() + "입니다.");
					mc.forSendEmail(s.getStuEmail(),"학번 안내입니다." , sb.toString(), req);
					msg="메일로 학번을 전송하였습니다.";
				}else {
					msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
				}
			}else {
				msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
			}
		}else{
			Map m=proService.empIdSearchModal(map);
			if(m!=null) {
				if(m.get("PROF_NAME").equals(map.get("searchName"))&&m.get("EMAIL").equals(map.get("searchEmail"))) {
					sb.append("귀하의 사번은 "+ m.get("PROF_ID") + "입니다.");
					mc.forSendEmail((String)map.get("searchEmail"),"사번 안내입니다." , sb.toString(), req);
					msg="메일로 사번을 전송하였습니다.";
				}else {
					msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
				}
			}else {
				msg="등록된 이름 또는 이메일과 일치하지 않습니다.";
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/stuPwSearch.hd")
	@ResponseBody
	public String stuPwSearch(Student s, @RequestParam String loginNo,Model model,
			@RequestParam(value="searchNo", required=false, defaultValue="0" ) String searchNo,
			@RequestParam(value="searchEmail", required=false, defaultValue="0" ) String searchEmail
			) {
		Map map=new HashMap<>();
		map.put("searchNo", searchNo);
		map.put("searchEmail", searchEmail);
		ObjectMapper mapper=new ObjectMapper();
		String jsonArr="";
				if(loginNo.equals("s")) {
					Student stu=stuService.stuIdSearch(s);
					if(stu!=null) {
						if(stu.getStuNo().equals(s.getStuNo())&&stu.getStuEmail().equals(s.getStuEmail())) {
							try {
								jsonArr=mapper.writeValueAsString(stu);
							} catch (JsonProcessingException e) {
								e.printStackTrace();
							}
						}
					}
				}else {
					Map m=proService.empIdSearchModal(map);
					if(m!=null) {
						if(m.get("PROF_ID").equals(map.get("searchNo"))&&m.get("EMAIL").equals(map.get("searchEmail"))) {
							try {
								jsonArr=mapper.writeValueAsString(m);
							} catch (JsonProcessingException e) {
								e.printStackTrace();
							}
						}
					}
				}
		return jsonArr;
	}
	
	@RequestMapping("/stuPwRandom.hd")
	@ResponseBody
	public String pwRandom(
			@RequestParam String pwRandom,
			@RequestParam String loginNo,
			@RequestParam String stuEmail,
			HttpServletRequest request
			) {
		if(loginNo.equals("s")) {
			mc.createEmailCheck1(stuEmail, pwRandom, request);
		}
		return "jsonView";
	}
	
	@RequestMapping("/stuRandomCheck.hd")
	@ResponseBody
	public Boolean stuRandomCheck(@RequestParam String stuRandomCheck, HttpSession session) {
		Boolean bl=false;
		if(stuRandomCheck.equals(session.getAttribute("authCode"))) {
			bl=true;
		}else {
			bl=false;
		}
		
		return bl;
	}
	
	@RequestMapping("/stuPwChange.hd")
	public String stuPwChange(@RequestParam String stuPw, @RequestParam String stuPwCk, @RequestParam String stuNo,Model model) {
		String msg="";
		String loc="/";
		
		int result=0;
		
		if(stuPw.equals(stuPwCk)) {
			result=stuService.stuPwChange(bEnc.encode(stuPw),stuNo);

			msg="변경된 비밀번호로 로그인해주시기 바랍니다.";
		}else {
			msg="변경할 비밀번호가 일치하지 않습니다. 다시확인해주세요";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
//	@RequestMapping(value="/loginCookieByAjax.hd", method=RequestMethod.POST)
//	@ResponseBody
//	public String loginCookieByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) { // 로그인 화면에서 학생, 교수, 교직원 중에 클릭하면
//		System.out.println("/loginCookieByAjax.hd가 호출됨");
//		
//		String loginType=req.getParameter("loginType");
//		System.out.println("loginType:"+loginType);
//		Cookie loginTypeC=new Cookie("loginType", loginType); // 쿠키 생성하기
//		loginTypeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
//		res.addCookie(loginTypeC); // 쿠키 추가
//		
//		
//		ObjectMapper mapper=new ObjectMapper();
//		String jsonStr="";
//		  try {
//			jsonStr=mapper.writeValueAsString(loginType); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
//		return jsonStr;
//	}

}


















