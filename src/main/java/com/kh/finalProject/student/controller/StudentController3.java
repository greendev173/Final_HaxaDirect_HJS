package com.kh.finalProject.student.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.student.model.service.StudentService3;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.MyClass;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;
import com.kh.finalProject.student.model.vo.StuTuition;
import com.kh.finalProject.student.model.vo.Student;


@Controller
public class StudentController3 {
	private Logger logger = LoggerFactory.getLogger(StudentController3.class);
	@Autowired
	private StudentService3 service;
	@Autowired
	private MyEncrypt enc;
	
	@RequestMapping("/student/tuitionBill.hd")
	public String selectTuition(HttpSession session, Model model) {
		System.out.println("/student/tuitionBill.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("오늘날짜:"+df.format(date));
		String today=df.format(date);
		
		System.out.println("금년도:"+today.substring(0, 4));
		int todayMonth=Integer.parseInt(today.substring(5, 7));
		System.out.println("금월:"+todayMonth);
		String semester="";
		if(todayMonth>=1&&todayMonth<=6) {
			semester="01";
		}else if(todayMonth>=7&&todayMonth<=12) {
			semester="02";
		}
		
		String acaYearSem=today.substring(0, 4)+"-"+semester;
		System.out.println("acaYearSem:"+acaYearSem);
		
		tuition.setAcaYearSem(acaYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		
		try {
			String stuBirthDay = enc.decrypt(student.getBirthday()); // 복호화 하기
			int birthYear=Integer.parseInt((stuBirthDay.substring(0, 2)));
			String birthMonth=stuBirthDay.substring(2, 4);
			String birthDate=stuBirthDay.substring(4, 6);
			if(birthYear>50&&birthYear<=99) { // 태어난 해가 50~100 사이 이면
				stuBirthDay="19"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}else if(birthYear<=50&&birthYear>=0) {
				stuBirthDay="20"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}
			student.setBirthday(stuBirthDay);
			System.out.println("student.getBirthday():"+student.getBirthday());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		StuTuition result=service.selectTuitionOne(tuition);
		
		try {
			String stuBirthDay = enc.decrypt(result.getBirthday()); // 복호화 하기
			int birthYear=Integer.parseInt((stuBirthDay.substring(0, 2)));
			String birthMonth=stuBirthDay.substring(2, 4);
			String birthDate=stuBirthDay.substring(4, 6);
			if(birthYear>50&&birthYear<=99) { // 태어난 해가 50~100 사이 이면
				stuBirthDay="19"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}else if(birthYear<=50&&birthYear>=0) {
				stuBirthDay="20"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}
			result.setBirthday(stuBirthDay);
			System.out.println("student.getBirthday():"+result.getBirthday());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		
		return "student/studentTuition";
	}
	
	
	@RequestMapping("/student/tuitionCert.hd")
	public String selectTuitionCert(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/tuitionCert.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		String selectYearSem="";
		String selectYearSemKor="";
		
		List<StuTuition> tuitionCertList=service.selectTuitionCertList(studentNo);
		for(int i=0; i<tuitionCertList.size(); i++) {
			String acaYear=tuitionCertList.get(i).getAcaYearSem().substring(0, 4);
			System.out.println("학년도:"+acaYear);
			int tcListLength=tuitionCertList.get(i).getAcaYearSem().length();
			String semester=tuitionCertList.get(i).getAcaYearSem().substring(tcListLength-2, tcListLength);
			System.out.println("학기:"+semester);
			tuitionCertList.get(i).setAcaYearSemKor(acaYear+"학년도 "+semester+"학기");
			if(i==0) {
				selectYearSem=acaYear+"-"+semester; // 가장 최근의 학년 학기만 저장
				selectYearSemKor=acaYear+"학년도 "+semester+"학기"; // 가장 최근의 학년 학기만 저장
			}
		}
		System.out.println("tuitionCertList:"+tuitionCertList);
		model.addAttribute("tuitionCertList", tuitionCertList);
		
		System.out.println("로그인한 아이디:"+studentNo);
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		tuition.setAcaYearSem(selectYearSem);
		StuTuition student=service.selectBasicStudentInfo(studentNo);
		
		try {
			String stuBirthDay = enc.decrypt(student.getBirthday()); // 복호화 하기
			int birthYear=Integer.parseInt((stuBirthDay.substring(0, 2)));
			String birthMonth=stuBirthDay.substring(2, 4);
			String birthDate=stuBirthDay.substring(4, 6);
			if(birthYear>50&&birthYear<=99) { // 태어난 해가 50~100 사이 이면
				stuBirthDay="19"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}else if(birthYear<=50&&birthYear>=0) {
				stuBirthDay="20"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
			}
			student.setBirthday(stuBirthDay);
			System.out.println("student.getBirthday():"+student.getBirthday());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(student.getStuAddr()!=null&&student.getStuAddr().contains("PSTC")&&student.getStuAddr().split("PSTC").length==2) {
			student.setStuPostcode(student.getStuAddr().split("PSTC")[0]); // 우편번호 저장
		}else {
			student.setStuPostcode(""); // 우편번호 저장
		}
		StuTuition result=service.selectTuitionOne(tuition);
		System.out.println("result:"+result);
		model.addAttribute("student", student); // 학생 기본 정보 보내기
		model.addAttribute("tuition", result);
		model.addAttribute("selectYearSemKor", selectYearSemKor);
		
		return "student/studentTuitionCert";
	}
	
	@RequestMapping("/student/tuitionCertAjax.hd")
	@ResponseBody
	public String selectTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		// @ResponseBody이용 jackson
		System.out.println("/student/tuitionCertAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String selectYearSem="";
		selectYearSem=req.getParameter("selectYearSem");
		System.out.println("ajax로 입력받은 selectYearSem:"+selectYearSem);
		
		tuition.setAcaYearSem(selectYearSem);
		
		ObjectMapper mapper=new ObjectMapper();
		StuTuition result=service.selectTuitionOne(tuition);
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(result); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
	
	@RequestMapping(value="/student/payTuitionAjax.hd", method=RequestMethod.POST)
	@ResponseBody
	public String updatePayTuitionByAjax(HttpSession session, HttpServletRequest req, HttpServletResponse res) { // 등록금을 납부하면
		System.out.println("/student/payTuitionAjax.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		StuTuition tuition=new StuTuition();
		tuition.setStuNo(studentNo);
		
		String curStuYearSem="";
		curStuYearSem=service.selectStuYearSem(studentNo); // 현재 학년-학기(예:1-1) 조회하기
		System.out.println("curAcaYearSem(변경 이전):"+curStuYearSem);
		int curAcaYear=0;
		int curSem=0;
		if(!curStuYearSem.equals("")&&curStuYearSem.split("-").length==2) { // 현재 학년 학기가 ""가 아니고, 현재 학년 학기가 "-"로 배열로 나눠질때
			curAcaYear=Integer.parseInt(curStuYearSem.split("-")[0]); // 현재 학년 저장
			curSem=Integer.parseInt(curStuYearSem.split("-")[1]); // 현재 학기 저장
			if(curSem==0) { // 신입생(1-0), 편입생(3-0)이면
				curSem=1; // 현재 학기 1학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}else if(curSem==1) { // 현재 학기가 1학기이면
				curSem=2; // 현재 학기 2학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}else if(curSem==2) { // 현재 학기가 2학기이면
				curAcaYear++; // 현재 학년에 1을 더해준다.
				curSem=1; // 현재 학기는 1학기로 설정
				curStuYearSem=curAcaYear+"-"+curSem;
			}
		}
		System.out.println("curAcaYearSem(변경 이후):"+curStuYearSem);
		Student student=new Student();
		student.setStuNo(studentNo);
		student.setStuYearSem(curStuYearSem); // 변경된 학년-학기(예:1-1) 저장
		
		String acaYearSem="";
		acaYearSem=req.getParameter("acaYearSem"); // ajax로 입력받은 현재 학년도(예:2019학년도 1학기) 학기
		System.out.println("ajax로 입력받은 acaYearSem:"+acaYearSem);
		tuition.setAcaYearSem(acaYearSem);
		System.out.println("update이전:"+tuition);
		
		String resultStr="";
		
		try {
			service.updateTuitionOne(tuition, student); // 학생 테이블에 학년 학기 update, 등록금 테이블도 PAYMENT_STAT, PAYMENT_DATE update
			resultStr="1"; // 업데이트 성공
		}catch(Exception e) {
			e.printStackTrace();
			resultStr="0"; // 업데이트 실패
			logger.info("등록금 업데이트 안 됨");
		}
		
		System.out.println("resultStr:"+resultStr);
		
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		  try {
			jsonStr=mapper.writeValueAsString(resultStr); // 매개변수에 배열도 들어갈 수 있다!! 매우 편리하다!! 자바스크립트 객체 형식으로 변환 해준다.
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  res.setContentType("application/json;charset=utf-8"); // 인코딩 설정하기
		return jsonStr;
	}
	
	
	@RequestMapping("/student/myGraduation.hd")
	public String selectMyGraduation(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/myGraduation.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		
		System.out.println("로그인한 아이디:"+studentNo);
		GraduationCon graduationCon=service.selectGraduationCon(studentNo);
		System.out.println("graduationCon:"+graduationCon);
		String birthday="";
		if(graduationCon!=null) {
			try {
				String stuBirthDay = enc.decrypt(graduationCon.getStuSSn()); // 복호화 하기
				int birthYear=Integer.parseInt((stuBirthDay.substring(0, 2)));
				String birthMonth=stuBirthDay.substring(2, 4);
				String birthDate=stuBirthDay.substring(4, 6);
				if(birthYear>50&&birthYear<=99) { // 태어난 해가 50~100 사이 이면
					stuBirthDay="19"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
				}else if(birthYear<=50&&birthYear>=0) {
					stuBirthDay="20"+birthYear+"년 "+birthMonth+"월 "+birthDate+"일";
				}
				birthday=stuBirthDay;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		model.addAttribute("graduationCon", graduationCon); // 학생 졸업조건 넘기기
		model.addAttribute("birthday", birthday); // 학생 생년월일 넘기기
		
		return "student/myGraduation";
	}
	
	@RequestMapping("/student/mySchedule.hd")
	public String selectMySchedule(HttpSession session, Model model, HttpServletRequest req) {
		System.out.println("/student/mySchedule.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		
		//////////////////////
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
		
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		MyScheduleForInfo msfi=new MyScheduleForInfo();
		msfi.setStuNo(studentNo);
		msfi.setAcaYear(acaYear);
		msfi.setAcaSemester(acaSemester);
		
		System.out.println("msfi:"+msfi);
		List<MySchedule> myScheduleList=service.selectMySchedule(msfi);
		System.out.println("myScheduleList:"+myScheduleList);
		
		model.addAttribute("acaYear", acaYear); // 학생 시간표 넘기기
		model.addAttribute("acaSemester", acaSemester); // 학생 시간표 넘기기
		model.addAttribute("myScheduleList", myScheduleList); // 학생 시간표 넘기기
		
		return "student/mySchedule";
	}
	
	@RequestMapping("/student/classBoard.hd")
	public String selectClassBoard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, 
			HttpSession session, Model model, HttpServletRequest req, String subSeq) {
		System.out.println("/student/classBoard.hd가 호출됨");
		
		Student stu=(Student)session.getAttribute("loginMember");
		String studentNo=stu.getStuNo();
		
		//////////////////////
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
		
		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		/////////////////////
		MyScheduleForInfo msfi=new MyScheduleForInfo();
		msfi.setStuNo(studentNo);
		msfi.setAcaYear(acaYear);
		msfi.setAcaSemester(acaSemester);
		
		System.out.println("msfi:"+msfi);
		List<MyClass> myClassList=service.selectMyClassList(msfi);
		System.out.println("myClassList:"+myClassList);
		
		model.addAttribute("acaYear", acaYear); 
		model.addAttribute("acaSemester", acaSemester); 
		model.addAttribute("myClassList", myClassList); // 학생 수강 과목 리스트 넘기기
		
		///////////////////////// 과제 게시판 하나 조회
		System.out.println("쿼리스트링으로 받은 subSeq:"+subSeq);
		if(!myClassList.isEmpty()) { // 학생의 과목 리스트가 비어 있지 않으면
			if(subSeq==null||subSeq=="") {
				msfi.setSubSeq(myClassList.get(0).getSubSeq()); // 과목 일련번호 저장하기
			}else {
				msfi.setSubSeq(subSeq);
			}
		}

		System.out.println("subSeq:"+subSeq);
		System.out.println("msfi.getSubSeq():"+msfi.getSubSeq());
		if(msfi.getSubSeq()==null) {
			msfi.setSubSeq("0");
		}
		int numPerPage=5;
		List<AssignmentRegister> arList=service.selectAsgmtBoardList(cPage, numPerPage, msfi);
		int totalData=service.selectAsgmtBoardCount(msfi);
		System.out.println("arList:"+arList);
		model.addAttribute("arList", arList);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("curSubSeq", msfi.getSubSeq());
		model.addAttribute("cPage", cPage);
		model.addAttribute("pageBar", PageFactory.getPageBarAsgmt(totalData, cPage, numPerPage, req.getContextPath()+"/student/classBoard.hd", msfi.getSubSeq()));
		///////////////////////// 과제 게시판 하나 조회 끝
		
		return "student/classBoard";
	}
	
	
	// 과제 한개 보기
	@RequestMapping("/student/selectAssignment")
	public ModelAndView selectAssignment(HttpSession session, HttpServletRequest request, String acaYear, String acaSemester, 
			String subSeq, String asgmtNo, HttpServletResponse response, String cPage) {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("/student/selectAssignment 들어옴.");
		Student stu=(Student)session.getAttribute("loginMember");
		String stuNo=stu.getStuNo();

		System.out.println("acaYear:"+acaYear);
		System.out.println("acaSemester:"+acaSemester);
		
		Cookie[] cookies=request.getCookies();
		String boardCookieVal="";
		boolean hasRead=false; // 읽었는지(true) 안 읽었는지(false) 구분하는 기준
		
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String value=c.getValue();
				if(c.getName().equals("boardCookie")) {
					boardCookieVal=value; // 이전값 보관
					if(value.contains("("+subSeq+"|"+asgmtNo+")")) { // 해당 번호의 게시판을 조회한 적이 있을 때(읽었을 때)
						hasRead=true;	// 조회했으면 true 대입
						break; // 반복문 나가기
					}
				}
			}
		}
		if(!hasRead) { // 해당 번호의 게시판을 조회한 적이 없을 때(안 읽었을 때 조회수를 추가하고 cookie에 현재 boardNo 기록)
			Cookie c=new Cookie("boardCookie", boardCookieVal+"("+subSeq+"|"+asgmtNo+")");
			c.setMaxAge(-1); // 브라우저가 닫히거나 로그아웃 됬을 때
			response.addCookie(c); // 쿠키 저장
		}
		
		/////////////////////
		MyScheduleForInfo msfi=new MyScheduleForInfo();
		msfi.setStuNo(stuNo);
		msfi.setAcaYear(acaYear);
		msfi.setAcaSemester(acaSemester);
		msfi.setSubSeq(subSeq);
		msfi.setAsgmtNo(asgmtNo);
		AssignmentRegister ar = service.selectAssignment(msfi, hasRead);

		System.out.println("ar:"+ar);
		mv.addObject("subSeq",subSeq);
		mv.addObject("asgmtNo",asgmtNo);
		mv.addObject("acaYear",acaYear);
		mv.addObject("acaSemester",acaSemester);
		mv.addObject("ar",ar);
		mv.addObject("cPage",cPage);
		
		mv.setViewName("student/selectAssignment");
		
		return mv;
	}
	
	// 파일 다운로드하기
	@RequestMapping("student/asgmtFiledownLoad.do")
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
			String loc="/student/selectAssignment?subSeq="+subSeq+"&asgmtNo="+asgmtNo+"&acaYear="+acaYear+"&acaSemester="+acaSemester+"&cPage="+cPage;
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			
			mv.setViewName("common/msg");
			
		}
		
		return mv;
	}
}
