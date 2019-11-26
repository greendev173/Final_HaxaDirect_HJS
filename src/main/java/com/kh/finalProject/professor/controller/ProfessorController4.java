package com.kh.finalProject.professor.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService4;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;
import com.kh.finalProject.professor.model.vo.Professor;

@Controller
public class ProfessorController4 { // 황준순 전용
	private Logger logger=LoggerFactory.getLogger(ProfessorController4.class);
	
	@Autowired
	ProfessorService4 service;
	
	// 과제등록 게시판 불러오기
	@RequestMapping("prof/assignmentBoard.hd")
	public String viewAssignmentReg(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, HttpSession session, 
			Model model, HttpServletRequest req, String subSeq) {
		System.out.println("prof/assignmentBoard.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		////////////////////// 이번 학년도 학기 조회
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String acaYear=today.substring(0, 4);
		String acaSemester="";
		if(todayMonth>=1&&todayMonth<=6) {
			acaSemester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
			acaSemester="2";
		}
		String profId=prof.getProfId();
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		InfoForProfSubject ifps=new InfoForProfSubject();
		ifps.setProfId(profId);
		ifps.setAcaYear(acaYear);
		ifps.setAcaSemester(acaSemester);
		
		System.out.println("ifps:"+ifps);
		List<ProfSubject> profSubjectList=service.selectProfSubject(ifps); // 이번 학년도 학기 교수의 과목 리스트 받아오기
		System.out.println("profSubjectList:"+profSubjectList);
		
		model.addAttribute("acaYear", acaYear);
		model.addAttribute("acaSemester", acaSemester);
		model.addAttribute("profSubjectList", profSubjectList); // 교수 해당 과목  view에 넘기기
		
		///////////////////////// 과제 게시판 하나 조회
		System.out.println("쿼리스트링으로 받은 subSeq:"+subSeq);
		if(!profSubjectList.isEmpty()) { // 교수의 과목 리스트가 비어 있지 않으면
			if(subSeq==null||subSeq=="") {
				ifps.setSubSeq(profSubjectList.get(0).getSubSeq()); // 과목 일련번호 저장하기
			}else {
				ifps.setSubSeq(subSeq);
			}
		}
		
		System.out.println("subSeq:"+subSeq);
		System.out.println("ifps.getSubSeq():"+ifps.getSubSeq());
		if(ifps.getSubSeq()==null) {
			ifps.setSubSeq("0");
		}
		int numPerPage=5;
		List<AssignmentRegister> arList=service.selectAsgmtBoardList(cPage, numPerPage, ifps);
		int totalData=service.selectAsgmtBoardCount(ifps);
		System.out.println("arList:"+arList);
		model.addAttribute("arList", arList);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("curSubSeq", ifps.getSubSeq());
		model.addAttribute("cPage", cPage);
		model.addAttribute("pageBar", PageFactory.getPageBarAsgmt(totalData, cPage, numPerPage, req.getContextPath()+"/prof/assignmentBoard.hd", ifps.getSubSeq()));
		///////////////////////// 과제 게시판 하나 조회 끝
		

		return "professor/assignmentBoard";
	}
	
	// 과제 한개 보기
	@RequestMapping("/prof/selectAssignment")
	public ModelAndView selectAssignment(HttpSession session, String acaYear, String acaSemester, String subSeq, String asgmtNo, String cPage) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("/prof/selectAssignment 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		//////////////////////
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
//		String acaYear=today.substring(0, 4);
//		String acaSemester="";
//		if(todayMonth>=1&&todayMonth<=6) {
//			acaSemester="1";
//		}else if(todayMonth>=7&&todayMonth<=12) {
//			acaSemester="2";
//		}
		String profId=prof.getProfId();
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		InfoForProfAssignment ifpa=new InfoForProfAssignment();
		ifpa.setProfId(profId);
		ifpa.setAcaYear(acaYear);
		ifpa.setAcaSemester(acaSemester);
		ifpa.setSubSeq(Integer.parseInt(subSeq));
		ifpa.setAsgmtNo(Integer.parseInt(asgmtNo));
		AssignmentRegister ar = service.selectAssignment(ifpa);
		
		// 날짜 시간 초 포맷 변경하기
//		SimpleDateFormat df2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("오늘날짜, 시간, 초:"+df2.format(date));
//		System.out.println("df2.format(ar.getAsgmtRegdDate()):"+df2.format(ar.getAsgmtRegdDate()));
//		ar.setAsgmtRegdDateStr(df2.format(ar.getAsgmtRegdDate())); // 날짜 시간 초 포맷 변경하기
		System.out.println("ar:"+ar);
		mv.addObject("subSeq",subSeq);
		mv.addObject("asgmtNo",asgmtNo);
		mv.addObject("acaYear",acaYear);
		mv.addObject("acaSemester",acaSemester);
		mv.addObject("ar",ar);
		mv.addObject("cPage",cPage);
		
		mv.setViewName("professor/selectAssignment");
		
		return mv;
	}
	
	// 과제등록 하기 화면으로 이동
	@RequestMapping("prof/assignmentRegister.hd")
	public String upAssignment(HttpSession session, Model model, String acaYearSem, String subSeq, String subName, String cPage) {
		System.out.println("prof/assignmentRegister.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		model.addAttribute("acaYearSem", acaYearSem);
		model.addAttribute("subSeq", subSeq);
		model.addAttribute("subName", subName);
		model.addAttribute("cPage", cPage);

		return "professor/assignmentRegister";
	}
	
	
	// 과제 수정 하기 화면으로 이동
	@RequestMapping("prof/assignmentModify.hd")
	public String updateAssignment(HttpSession session, Model model, String acaYear, String acaSemester, String subSeq, String subName
			, String asgmtNo, String cPage) {
		System.out.println("prof/assignmentModify.hd 들어옴.");
		Professor prof=(Professor)session.getAttribute("loginMember");
		
		InfoForProfAssignment ifpa=new InfoForProfAssignment();
		String profId=prof.getProfId();
		ifpa.setProfId(profId);
		ifpa.setAcaYear(acaYear);
		ifpa.setAcaSemester(acaSemester);
		ifpa.setSubSeq(Integer.parseInt(subSeq));
		ifpa.setAsgmtNo(Integer.parseInt(asgmtNo));
		AssignmentRegister ar = service.selectAssignment(ifpa);
		
		model.addAttribute("acaYear", acaYear);
		model.addAttribute("acaSemester", acaSemester);
		model.addAttribute("subName", subName);
		model.addAttribute("subSeq", subSeq);
		model.addAttribute("asgmtNo", asgmtNo);
		model.addAttribute("ar", ar);
		model.addAttribute("cPage", cPage);

		return "professor/updateAssignment";
	}
	
	
	// 과제 수정 하기 화면으로 이동
	@RequestMapping("prof/assignmentModifyEnd.hd")
	public ModelAndView updateAssignmentEnd(@RequestParam(value="asgmtFile", required=false)MultipartFile upFile, HttpServletRequest req, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		logger.debug(upFile.getOriginalFilename());
		// 입력된 파일 서버에 저장하기
		// 1. 파일저장 경로
		String saveDir=req.getSession().getServletContext().getRealPath("/resources/upload/asgmtBoard");
		AssignmentRegister ar=new AssignmentRegister();
		
		// 저장경로가 없으면 생성하고 있으면 생성하지 않는 코드 작성
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("폴더생성 "+dir.mkdirs());
		// 다중파일 서버에 저장 로직
		System.out.println("upFile:"+upFile);
		System.out.println("upFile.getOriginalFilename():"+upFile.getOriginalFilename()+"끝");
		if(!upFile.getOriginalFilename().equals("")) { // 첨부파일이 있으면
			// 파일명 설정(renamed)
			String oriFileName=upFile.getOriginalFilename();
			// 파일명에서 확장자 빼기
			String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
			// rename 규칙 설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*1000); // 겹치지 않게 하기 위해서 random함수 이용
			String reName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
			// reName된 파일명으로 저장하기
			try {
				upFile.transferTo(new File(saveDir+"/"+reName));
			}catch(IOException e) {
				e.printStackTrace();
			}
			// 서버에 실제 파일 저장완료!
			ar.setAsgmtRegdOrifileName(oriFileName);
			ar.setAsgmtRegdRefileName(reName);
		}else { // 첨부파일이 없으면
			ar.setAsgmtRegdOrifileName(""); // 첨부파일 원본 이름 빈칸으로 설정
			ar.setAsgmtRegdRefileName(""); // 첨부파일 새로운 이름 빈칸으로 설정
		}
		
		Professor prof=(Professor)session.getAttribute("loginMember");
		String subSeq=req.getParameter("subSeq");
		System.out.println("subSeq:"+subSeq);
		String asgmtNo=req.getParameter("asgmtNo");
		System.out.println("asgmtNo:"+asgmtNo);
		
		ar.setSubSeq(subSeq);
		ar.setAsgmtNo(Integer.parseInt(asgmtNo));
		ar.setProfId(prof.getProfId()); // 교수 아이디 저장
		
		//////////////////////이번 학년도 학기 조회
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String acaYear=today.substring(0, 4);
		String acaSemester="";
		if(todayMonth>=1&&todayMonth<=6) {
		acaSemester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
		acaSemester="2";
		}
		String profId=prof.getProfId();
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		
		ar.setAsgmtRegdTitle((String)req.getParameter("asgmtTitle")); // 과제 제목 저장
		ar.setAsgmtRegdContent((String)req.getParameter("asgmtContent")); // 과제 내용 저장
		
		
		int result=0;
		String msg="";
		String loc="/prof/assignmentBoard.hd?subSeq="+subSeq;
		try {
			result=service.updateAssignment(ar); // update문 실행
		}catch(Exception e) {
			// 파일 삭제 로직
			// 에러 메세지 출력 로직
			logger.debug("에러에러에러 삽입 안됨");
			// 파일 삭제
			if(ar.getAsgmtRegdOrifileName()!=null) { // list가 비어 있지 않으면
				File  del=new File(saveDir+"/"+ar.getAsgmtRegdRefileName()); // 방금 업로드한 renameFile 찾기
				del.delete(); // 방금 업로드한 파일 삭제하기
			}
		}
		if(result==1) {
			msg="정상적으로 수정되었습니다.";
		}else if(result==0) {
			msg="수정이 실패하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
			
//		mv.setViewName("redirect:/prof/assignmentBoard.hd");
//		return "common/msg";
		mv.setViewName("common/msg");
		return mv;
	}
		
	
	/* 과제 등록하기, 스프링 파일 업로드하기 */
	@RequestMapping("prof/assignmentRegisterEnd.do")
	public ModelAndView insertAssignment(@RequestParam(value="asgmtFile", required=false)MultipartFile upFile, HttpServletRequest req, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		logger.debug(upFile.getOriginalFilename());
		// 입력된 파일 서버에 저장하기
		// 1. 파일저장 경로
		String saveDir=req.getSession().getServletContext().getRealPath("/resources/upload/asgmtBoard");
		AssignmentRegister ar=new AssignmentRegister();
		
		// 저장경로가 없으면 생성하고 있으면 생성하지 않는 코드 작성
		File dir=new File(saveDir);
		if(!dir.exists()) logger.debug("폴더생성 "+dir.mkdirs());
		// 다중파일 서버에 저장 로직
		System.out.println("upFile:"+upFile);
		System.out.println("upFile.getOriginalFilename():"+upFile.getOriginalFilename()+"끝");
		if(!upFile.getOriginalFilename().equals("")) { // 첨부파일이 있으면
			// 파일명 설정(renamed)
			String oriFileName=upFile.getOriginalFilename();
			// 파일명에서 확장자 빼기
			String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
			// rename 규칙 설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*1000); // 겹치지 않게 하기 위해서 random함수 이용
			String reName=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
			// reName된 파일명으로 저장하기
			try {
				upFile.transferTo(new File(saveDir+"/"+reName));
			}catch(IOException e) {
				e.printStackTrace();
			}
			// 서버에 실제 파일 저장완료!
			ar.setAsgmtRegdOrifileName(oriFileName);
			ar.setAsgmtRegdRefileName(reName);
		}else { // 첨부파일이 없으면
			ar.setAsgmtRegdOrifileName(""); // 첨부파일 원본 이름 빈칸으로 설정
			ar.setAsgmtRegdRefileName(""); // 첨부파일 새로운 이름 빈칸으로 설정
		}
		
		Professor prof=(Professor)session.getAttribute("loginMember");
		String subSeq=req.getParameter("subSeq");
		ar.setAsgmtSeq(Integer.parseInt(subSeq));
		ar.setProfId(prof.getProfId()); // 교수 아이디 저장
		
		//////////////////////이번 학년도 학기 조회
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String acaYear=today.substring(0, 4);
		String acaSemester="";
		if(todayMonth>=1&&todayMonth<=6) {
		acaSemester="1";
		}else if(todayMonth>=7&&todayMonth<=12) {
		acaSemester="2";
		}
		String profId=prof.getProfId();
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		InfoForProfSubject ifps=new InfoForProfSubject();
		ifps.setProfId(profId);
		ifps.setAcaYear(acaYear);
		ifps.setAcaSemester(acaSemester);
		ifps.setSubSeq((String)req.getParameter("subSeq"));
		int curAsgmtCount=service.selectAsgmtBoardCount(ifps); // 현재 과제 개수 받아오기
		
		ar.setAsgmtNo(curAsgmtCount+1); // 과제 번호 하나 증가
		ar.setAsgmtRegdTitle((String)req.getParameter("asgmtTitle")); // 과제 제목 저장
		ar.setAsgmtRegdContent((String)req.getParameter("asgmtContent")); // 과제 내용 저장
		
		
		int result=0;
		String msg="";
		String loc="/prof/assignmentBoard.hd?subSeq="+subSeq;
		try {
			result=service.insertAssignment(ar);
		}catch(Exception e) {
			// 파일 삭제 로직
			// 에러 메세지 출력 로직
			logger.debug("에러에러에러 삽입 안됨");
			// 파일 삭제
			if(ar.getAsgmtRegdOrifileName()!=null) { // list가 비어 있지 않으면
				File  del=new File(saveDir+"/"+ar.getAsgmtRegdRefileName()); // 방금 업로드한 renameFile 찾기
				del.delete(); // 방금 업로드한 파일 삭제하기
			}
		}
		if(result==1) {
			msg="정상적으로 등록되었습니다.";
		}else if(result==0) {
			msg="등록이 실패하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
			
//		mv.setViewName("redirect:/prof/assignmentBoard.hd");
//		return "common/msg";
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 파일 다운로드하기
	@RequestMapping("prof/asgmtFiledownLoad.do")
	public ModelAndView fileDownLoad(String oName, String rName, HttpServletRequest req, HttpServletResponse res
			, String subSeq, String asgmtNo, String acaYear, String acaSemester, String cPage) { // 페이지에서 rName 받아온다.
		// 파일 입출력을 위한 Stream을 선언
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		ModelAndView mv=new ModelAndView();
		
		// 파일을 가져올 경로
		String saveDir=req.getSession().getServletContext().getRealPath("/resources/upload/asgmtBoard");
		File downFile=new File(saveDir+"/"+rName); // 페이지에서 rName 받아온다.
		if(downFile.exists()) { // 파일이 존재하면
			try {
				FileInputStream fis=new FileInputStream(downFile);
				bis=new BufferedInputStream(fis);
				sos=res.getOutputStream();
				String resFileName="";
				boolean isMSIE=req.getHeader("user-agent").indexOf("MSIE")!=-1||req.getHeader("user-agent").indexOf("Trident")!=-1; // 인터넷 익스플로러는 표준을 안지키므로 별도로 설정
				if(isMSIE) { // 브라우저가 인터넷 익스플로러 이면
					resFileName=URLEncoder.encode(oName, "UTF-8"); // utf-8로 인코딩
					resFileName=resFileName.replaceAll("\\+", "%20");	// 띄어쓰기를 %20으로 바꾼다.
				}else { // 아니면
					resFileName=new String(oName.getBytes("UTF-8"), "ISO-8859-1");
				}
				res.setContentType("application/octet-stream;charset=utf-8"); // 응답을 바이너리 파일로 준다.
				res.addHeader("Content-Disposition", "attachment;filename=\""+resFileName+"\""); // 바이너리 파일 이름 지정, attachment: 팝업창 띄우기!!
				res.setContentLength((int)downFile.length());
				int read=0;
				while((read=bis.read())!=-1) { // 모두 다운로드가 안되었으면
					sos.write(read); // 스트림을 이용해서 바이트 단위로 보낸다.
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
		}else { // 파일이 존재하지 않으면
			String msg="죄송합니다.\\n서버에 파일이 존재하지 않습니다.";
			String loc="/prof/selectAssignment?subSeq="+subSeq+"&asgmtNo="+asgmtNo+"&acaYear="+acaYear+"&acaSemester="+acaSemester
					+"&cPage="+cPage;
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			
			mv.setViewName("common/msg");
			
		}
		
		return mv;
	}
}
