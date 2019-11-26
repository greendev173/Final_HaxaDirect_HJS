package com.kh.finalProject.professor.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService1;
import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Controller
public class ProfessorController1 {
	private Logger logger = LoggerFactory.getLogger(ProfessorController1.class);
	@Autowired
	private ProfessorService1 service;
	
	@Autowired
	private MyEncrypt enc;
	
	@Autowired
	private BCryptPasswordEncoder bcp;
	
	//과목선택
	@RequestMapping(value="/professor/selectSubject", produces = "application/text; charset=utf8")
	@ResponseBody
	public String seletcSubject(String subCode,String subTime,@RequestParam String subYear,@RequestParam String targetGrade,@RequestParam String subSemester, HttpServletResponse res) {
		
		ObjectMapper mapper = new ObjectMapper();
		logger.info("subCode : "+subCode);
		logger.info("subTime : "+subTime);
		
		Map<String,String> param = new HashMap<String,String>();
		param.put("subCode",subCode);
		param.put("subTime",subTime.trim());
		param.put("subYear",subYear);
		param.put("targetGrade",targetGrade);
		param.put("subSemester",subSemester);
		
		logger.info("param : "+param);
		
		Map<String,String> map = service.selectSubject(param);

		
		String jsonStr = "";
		try {
			jsonStr = mapper.writeValueAsString(map); // 멤버변수에 있는 값 들을 전부 자바스크립트 객체방식으로 바꿈( {key:value} 형식으로 )
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=UTF-8");
		
		return jsonStr; // <- 받아온 객체가 넘어간다
	}
	//강의개설 뷰
	@RequestMapping("/professor/insertSubject")
	public ModelAndView insertSubject(Model model) {
		
		ModelAndView mv  = new ModelAndView();
		
		List<InsertClass> list = service.insertSubject();
		
		mv.addObject("iClassView",list);
		
		mv.setViewName("professor/insertSubject");
		
		return mv;
	}
//	강의개설 END
	@RequestMapping("/professor/insertSubjectEnd")
	@ResponseBody
	public String insertSubjectEnd(MultipartFile upfile,@RequestParam Map<String,String> map,HttpServletRequest req,HttpServletResponse res) {
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(upfile != null && !upfile.isEmpty()) {
			String oriFileName = upfile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int random = (int)(Math.random()*1000);
			String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
			
			try {
				upfile.transferTo(new File(saveDir+"/"+reName));
			}catch(IOException e){
				e.printStackTrace();
			}
			
			map.put("upFile", reName);
			map.put("oriFile",oriFileName);
			
		}else {
			map.put("upFile","파일없음");
			map.put("oriFile","파일없음");
		}
		
		logger.info("맵 : "+map);
		
//		map.put("");
		
		List<InsertClass> list = new ArrayList<InsertClass>();
		try {
			list=service.insertSubjectEnd(map);
			logger.info("map : "+map);
			logger.info("성공");
		}catch(RuntimeException e) {
			e.printStackTrace();
			logger.info("생성불가");
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		res.setContentType("application/json;charset=UTF-8");
		
		
		return jsonStr;
	}
	//강의 상세 조회
	@RequestMapping("/professor/subjectView")
	public String subjectView(Model model, String subCode, String profId, String subTime) {
		
		Map<String,String> result = new HashMap<String,String>();
		
		result.put("subCode",subCode);
		result.put("profId",profId);
		result.put("subTime",subTime);
		
		logger.info("result : ",result);
		
		Map<String,String> map = service.selectSubjectView(result);
		
		logger.info("강의상세조회map : "+map);
		
		model.addAttribute("selectSubjectView",map);
		
		return "professor/subjectView";
	}
	//강의 개설 YN
	@RequestMapping("/professor/subjectYn")
	public ModelAndView subjectYn(String subCode) {
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		logger.info("서브코드는? "+subCode);
		
		try {
			service.subjectYn(subCode);
			msg = "개설 완료!";
			loc = "/professor/insertSubject";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "개설 실패!";
			loc = "/professor/insertSubject";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	//교수정보
	@RequestMapping("/professor/professorView")
	public String professorView(Model model, String profId, HttpSession session) {
		Professor pro = new Professor();
		pro = (Professor)session.getAttribute("loginMember");
		
		//복호화
		try {
			String jumin = enc.decrypt(pro.getProfSsn()).subSequence(0, 7)+"******";
			model.addAttribute("jumin",jumin);
			logger.info("주민번호 : "+jumin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		List<Subject> p = service.professorView(profId);
		
		logger.info("리스트 : "+p);
		
		model.addAttribute("prof",p);
		
		return "professor/professorView";
	}
	//교수 정보 수정
	@RequestMapping("/professor/updateProf")
	public String updateProfessor(Model model, String profId, HttpSession session) {
		
		Professor pro = new Professor();
		pro = (Professor)session.getAttribute("loginMember");
		
		//복호화
		try {
			String jumin = enc.decrypt(pro.getProfSsn()).subSequence(0, 8)+"******";
			model.addAttribute("jumin",jumin);
			logger.info("주민번호1 : "+jumin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Subject> p = service.professorView(profId);
		
		model.addAttribute("prof",p);
		
		return "professor/updateProfessor";
	}
	@RequestMapping("/professor/updateProfessorEnd")
	public String updateProfessorEnd(Model model, HttpServletRequest req, Professor p, HttpSession session) {
		
		String msg = "";
		String loc ="/";
		
		Professor pro = new Professor();
		pro = (Professor)session.getAttribute("loginMember");
		//복호화
		try {
			String jumin = enc.decrypt(pro.getProfSsn()).subSequence(0, 8)+"******";
			model.addAttribute("jumin",jumin);
			logger.info("주민번호2 : "+jumin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int result = service.updateProfessorEnd(p);
		if(result>0) {
			msg = "수정완료";
			loc = "/professor/professorView?profId="+p.getProfId();
		}else {
			msg = "수정실패";
			loc = "/professor/professorView?profId="+p.getProfId();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	//교수 비밀번호 변경
	@RequestMapping("/professor/updatePwd")
	public String profUpdatePwd(Model model, HttpServletRequest req, HttpSession session) {
		
		Professor pro = new Professor();
		pro = (Professor)session.getAttribute("loginMember");
		
		//복호화
//		try {
//			String profPw = enc.decrypt(pro.getProfPw());
//			model.addAttribute("profPw",profPw);
//			logger.info("비밀번호 복호화 : "+profPw);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		String profId = req.getParameter("profId");
		
		model.addAttribute("profId",profId);
		
		return "professor/profUpdatePwd";
	}
	@RequestMapping("/professor/profUpdatePwdEnd")
	public String profUpdatePwdEnd(Model model, HttpServletRequest req, Professor p, HttpSession session) {
		
		String profId = req.getParameter("profId");
		logger.info("아이디 : "+profId);
		String profPw = req.getParameter("profPw"); //현재비밀번호
		String profPwdUpdate = req.getParameter("profPwdUpdate"); //바꿀비밀번호
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("profId",profId);
		Professor profPwd = new Professor();
		profPwd = service.selectPwd(profId);
		
		logger.info("비밀번호 : "+profPwd.getProfPw());
		
		int result=0;
		
		if(bcp.matches(profPw, profPwd.getProfPw())) { // 왼쪽은 view에서 입력받은 현재 암호, 오른쪽 매개변수는 DB에 저장된 암호
			map.put("profPwdUpdate",bcp.encode(profPwdUpdate));
			result = service.profUpdatePwdEnd(map);
		}
		
		String msg = "";
		String loc ="/";
		
		
		if(result>0) {
			msg = "비밀번호 변경완료! 다시 로그인 해주세요.";
			loc = "/index.jsp";
			session.invalidate();
		}else {
			msg = "비밀번호가 다릅니다!";
			loc = "/professor/updatePwd?profId="+profId;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	//강의 자료 게시판
	@RequestMapping("/professor/lectureData")
	public String lectureData(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage ,Model model) {
//		Professor p1 = (Professor)session.getAttribute("loginMember");
//		String id = p1.getProfId();
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		int numPerPage=10;
		
		List<ProfessorBoard> list = service.boardView(cPage, numPerPage);
		int totalData = service.selectBoardCount();
		
		model.addAttribute("board",list);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/lectureData"));
		
		return "professor/lectureData";
	}
	//게시판 보기
	@RequestMapping("/professor/selectBoardView")
	public ModelAndView selectBoardView(int profBoardNo,HttpServletRequest req,HttpServletResponse res) {
		
		//쿠키값
		Cookie[] cookies = req.getCookies();
		String boardCookieVal = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				if("boardCookie".equals(name)) {
					boardCookieVal = value; //이전값 보관
					if(value.contains("|"+profBoardNo+"|")) {
						hasRead = true;
						break;
					}
				}
			}
		}
		//안읽었을때 쿠키에 조회수 추가
		//현재 profBoardNo에 기록
		if(!hasRead) {
			Cookie c = new Cookie("boardCookie",boardCookieVal+"|"+profBoardNo+"|");
			c.setMaxAge(-1); //로그아웃시 삭제됨
			res.addCookie(c);
		}
		
		ModelAndView mv = new ModelAndView();
		
		ProfessorBoard pb = service.selectBoardView(profBoardNo,hasRead);
		List<ProfBoardAttachment> pba = service.selectProfAttachment(profBoardNo);
		
		try {
			mv.addObject("profBoard",pb);
			mv.addObject("profAttachment",pba);
			logger.info("조회수 증가");
		}catch(RuntimeException e) {
			e.printStackTrace();
			logger.info("조회수 증가안함");
		}
		
		
		mv.setViewName("/professor/selectBoardView");
		
		return mv;
	}
	//게시판 등록
	@RequestMapping("/professor/insertBoard")
	public String insertBoard(Model model) {
		
//		Professor p = service.professorView();
//		
//		model.addAttribute("prof",p);
		
		return "professor/insertBoard";
	}
	
	@RequestMapping("/professor/insertBoardEnd")
	public ModelAndView insertBoardEnd(MultipartFile[] upFile, HttpServletRequest req, ProfessorBoard pb, String profId) {

		String msg = "";
		String loc = "";
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		List<ProfBoardAttachment> list = new ArrayList<ProfBoardAttachment>();
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int random = (int)(Math.random()*1000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
				
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				ProfBoardAttachment pba = new ProfBoardAttachment();
				pba.setBoardOrifilename(oriFileName);
				pba.setBoardRefilename(reName);
				
				list.add(pba);
			}
			
		}
		
		pb.setProfId(profId);
		
		try {
			service.insertBoardEnd(pb,list);
			msg = "작성 완료";
			loc = "/professor/lectureData";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "작성 실패";
			loc = "/professor/insertBoardEnd";
			logger.info("생성불가");
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	//게시판수정
	@RequestMapping("/profBoard/updateBoard")
	public ModelAndView updateBoard(int profBoardNo, HttpServletRequest req, HttpServletResponse res) {
		
		ModelAndView mv = new ModelAndView();
		
		//쿠키값
		Cookie[] cookies = req.getCookies();
		String boardCookieVal = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				if("boardCookie".equals(name)) {
					boardCookieVal = value; //이전값 보관
					if(value.contains("|"+profBoardNo+"|")) {
						hasRead = true;
						break;
					}
				}
			}
		}	
				
		//안읽었을때 쿠키에 조회수 추가
		//현재 profBoardNo에 기록
		if(!hasRead) {
			Cookie c = new Cookie("boardCookie",boardCookieVal+"|"+profBoardNo+"|");
			c.setMaxAge(-1); //로그아웃시 삭제됨
			res.addCookie(c);
		}
		
		try {
			mv.addObject("prof",service.selectBoardView(profBoardNo,hasRead));
			mv.addObject("profAttachment",service.selectProfAttachment(profBoardNo));
			logger.info("조회수 증가");
		}catch(RuntimeException e) {
			e.printStackTrace();
			logger.info("조회수 안올라감");
		}
		
//		mv.addObject("prof",service.selectBoardView(profBoardNo,hasRead));
//		mv.addObject("profAttachment",service.selectProfAttachment(profBoardNo));
		
		
		mv.setViewName("/professor/updateBoard");
		
		return mv;
	}
	@RequestMapping("/profBoard/updateBoardEnd")
	public ModelAndView updateBoardEnd(MultipartFile[] upFile, HttpServletRequest req, ProfessorBoard pb) {

		String msg = "";
		String loc = "";
		
		ModelAndView mv = new ModelAndView();
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		List<ProfBoardAttachment> list = new ArrayList<ProfBoardAttachment>();
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int random = (int)(Math.random()*1000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+random+ext;
				
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				ProfBoardAttachment pba = new ProfBoardAttachment();
				pba.setBoardOrifilename(oriFileName);
				pba.setBoardRefilename(reName);
				
				list.add(pba);
			}
			
		}
		
		try {
			service.updateBoardEnd(pb,list);
			msg = "수정 완료";
			loc = "/professor/lectureData";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "수정 실패";
			loc = "/professor/insertBoardEnd";
			logger.info("생성불가");
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	//게시판 삭제
	@RequestMapping("/profBoard/deleteBoard")
	public ModelAndView deleteBoard(ProfessorBoard pb, ProfBoardAttachment pba) {
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		
		try {
			int result = service.deleteBoard(pb,pba);
			msg = "삭제 완료";
			loc = "/professor/lectureData";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "삭제 실패";
			loc = "/professor/lectureData";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
//	과목조회
	@RequestMapping("/professor/subjectCodeView")
	public String subjectCodeView(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, Model model,String profId) {
		
		int numPerPage = 5;
		
		List<Subject> list = service.subjectCodeView(cPage,numPerPage,profId); //
		int totalData = service.selectSubjectCount(profId);
		
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/subjectList"));
		
		return "professor/subjectList";
	}
	//파일 다운로드용
	@RequestMapping("/professor/fileDownLoad")
	public void fileDownload(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/SubjectProject");
		
		File downFile = new File(saveDir+"/"+rName);
		
		try {
			FileInputStream fis = new FileInputStream(downFile);
			bis = new BufferedInputStream(fis);
			
			sos = res.getOutputStream();
			String resFileName = "";
			
			boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE")!=-1 || req.getHeader("user-agent").indexOf("Trident")!=-1;
			
			if(isMSIE) {
				resFileName = URLEncoder.encode(oName, "UTF-8");
				resFileName = resFileName.replaceAll("\\+", "%20");
			}else {
				resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			res.addHeader("Content-Disposition", "attachment;filename=\""+resFileName+"\"");
			
			res.setContentLength((int)downFile.length());
			int read = 0;
			
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	//교수 강의계획서 뷰
	@RequestMapping("professor/lecturePlan")
	public String planView(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, Model model) {
		
		int numPerPage=10;
		
//		ModelAndView mv = new ModelAndView();
		
		List<PlanBoard> list = service.planBoardView(cPage, numPerPage);
		
		int totalData = service.selectPlanCount();
		

		model.addAttribute("plan",list);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/planView"));
		
//		mv.setViewName("professor/planView");
		
		return "professor/planView";
	}
	
	//계획서 작성
	@RequestMapping("/professor/insertPlan")
	public String insertPlan() {
		
		return "professor/insertPlan";
	}
	
	//계획서 작성 End
	@RequestMapping("/professor/insertPlanEnd")
	public ModelAndView insertPlanEnd(PlanBoard p) {
		String msg = "";
		String loc = "";
		ModelAndView mv = new ModelAndView();
		
		try {
			service.insertPlanEnd(p);
			msg = "작성 완료!";
			loc = "/professor/lecturePlan";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "작성 실패!";
			loc = "/professor/lecturePlan";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	//강의 계획서 select
	@RequestMapping("/professor/selectPlanView")
	public ModelAndView selectPlanView(int planNo) {
		
		ModelAndView mv = new ModelAndView();
		
		PlanBoard p = service.selectPlanView(planNo);
		
		mv.addObject("plan",p);
		
		mv.setViewName("professor/selectPlanView");
		
		return mv;
	}
	//강의 계획서 수정
	@RequestMapping("/professor/updatePlan")
	public ModelAndView updatePlan(int planNo) {
		ModelAndView mv = new ModelAndView();
		
		PlanBoard p = service.selectPlanView(planNo);
		
		mv.addObject("plan",p);
		
		mv.setViewName("professor/updatePlan");
		
		return mv;
	}
	//강의 계획서 수정 END
	@RequestMapping("/professor/updatePlanEnd")
	public ModelAndView updatePlanEnd(@RequestParam Map<String,String> map) {
		ModelAndView mv = new ModelAndView();
		
		
		String msg = "";
		String loc = "";
		
		try {
			service.updatePlanEnd(map);
			msg = "수정 완료!";
			loc = "/professor/lecturePlan";
		}catch(RuntimeException e) {
			e.printStackTrace();
			msg = "수정 실패!";
			loc = "/professor/lecturePlan";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	//강의 계획서 삭제
	
	//교수 시간표
	@RequestMapping("/professor/profSchedule")
//	@ResponseBody
	public ModelAndView profSchedule(String profId, Model model, HttpServletResponse res) {
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("profId",profId);
		
		ModelAndView mv = new ModelAndView();
		
		logger.info("profId : "+profId);
		
		List<Map<String,String>> schedule = service.profSchedule(profId);
		logger.info("스케줄map : "+schedule);
		
		mv.addObject("schedule",schedule);
		
		mv.setViewName("/professor/profScheduleAjaxPage");
		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = "";
//		try {
//			jsonStr = mapper.writeValueAsString(schedule);
//		}catch(JsonProcessingException e) {
//			e.printStackTrace();
//		}
//		res.setContentType("application/json;charset=UTF-8");
		
		return mv;
	}
	//교수별 강의시간표
	@RequestMapping("/professor/deptProfSchedule")
	public String deptProfSchedule(Model model,String deptCode) {
		
		
		
		logger.info("deptCode : "+deptCode);
		List<Map<String,String>> schedule = service.deptProfScheduleView(deptCode);
		List<Map<String,String>> deptCodeView = service.deptCodeView(deptCode);
		logger.info("교수별 강의시간표 : " + schedule);
		model.addAttribute("schedule",schedule);
		model.addAttribute("deptCodeView",deptCodeView);
		
		return "professor/deptProfSchedule";
	}
	//교수별 강의시간표 deptcode select
	@RequestMapping("/professor/selectDeptProfSchedule")
	public ModelAndView selectDeptProfSchedule(String deptCode, HttpServletResponse res, Model model) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Map<String,String>> selectDeptCode = service.selectDeptCode(deptCode);
		List<Map<String,String>> selectDeptName = service.selectDeptName(deptCode);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		
		mv.addObject("selectDeptCode",selectDeptCode);
		mv.addObject("selectDeptName",selectDeptName);
		mv.setViewName("professor/selectDeptProfSchedule");
		
//		model.addAttribute("selectDeptCode",selectDeptCode);
		
//		try {
//			jsonStr = mapper.writeValueAsString(selectDeptCode);
//		}catch(JsonProcessingException e) {
//			e.printStackTrace();
//		}
		
		//res.setContentType("application/json;charset=UTF-8");
		
		return mv;
//		return "professor/selectDeptProfSchedule";
	}
	//강의자료 게시판
	@RequestMapping("/professor/searchData")
	@ResponseBody
	public String searchData(String search, HttpServletResponse res,@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		
		int numPerPage = 10;
		
		logger.info("입력값 : "+search);
		
		Map<String,String> search_ = new HashMap<String,String>();
		search_.put("search",search);
		
		List<Map<String,String>> searchData = service.searchData(search_);
//		List<Map<String,String>> searchData = service.searchData(search,cPage,numPerPage); 페이징
		
		int totalData = service.selectBoardCount();
		
//		Map searchData=new HashMap();
//		logger.info("검색한 리스트 값 : "+searchData);
//		searchData.put("searchData",searchData);
//		searchData.put("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/searchData"));
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		
		try {
			jsonStr = mapper.writeValueAsString(searchData);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		res.setContentType("application/json;charset=UTF-8");
		
		
		return jsonStr;
	}
	//강의계획서 검색
	@ResponseBody
	@RequestMapping("/professor/searchPlan")
	public String searchPlan(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage,String typing, HttpServletResponse res) {
		
		int numPerPage = 10;
		
		Map<String,String> typing_ = new HashMap<String,String>();
		typing_.put("typing",typing);
		
		logger.info("typing : "+typing);
		List<Map<String,String>> typingPlan = service.searchPlan(typing_);
		
		logger.info("계획서 검색 : "+typingPlan);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		
		try {
			jsonStr = mapper.writeValueAsString(typingPlan);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		res.setContentType("application/json;charset=UTF-8");
		
		return jsonStr;
	}
	//교수별 강의내역
	@RequestMapping("/professor/profPlanResult")
	public ModelAndView profPlanResult(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		
		int numPerPage = 10;
		
		ModelAndView mv = new ModelAndView();
		
		List<Map<String,String>> profPlanResult = service.profPlanResult(cPage,numPerPage);
		int totalData = service.totalPlanResult();
		
		mv.addObject("planResult",profPlanResult);
		mv.addObject("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, "/finalProject/professor/profPlanResult"));
		mv.setViewName("/professor/profPlanResult");
		
		return mv;
	}
	//내 강의내역
	@RequestMapping("/professor/myPlanResult")
	@ResponseBody
	public String myPlanResult(String profId, HttpServletResponse res) {
		
		logger.info("profId는 ? "+profId);
		
		List<Map<String,String>> myPlanResult = service.myPlanResult(profId);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = "";
		
		try {
			jsonStr = mapper.writeValueAsString(myPlanResult);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		res.setContentType("application/json;charset=UTF-8");
		
		return jsonStr;
	}
}



