package com.kh.finalProject.professor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.service.ProfessorService2;
import com.kh.finalProject.professor.model.vo.AttendStudent;
import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectAttendList;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_ClassInfo;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Request;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class ProfessorController2 {
	// 학과생조회

	@Autowired
	ProfessorService2 service;

	@RequestMapping("prof/viewInMajor.hd")
	public String viewInMajor(SelectInMajor sim, HttpServletRequest req,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			HttpSession session) throws JsonProcessingException {
//		@RequestParam(required = false) ? 왜 
		int numPerPage = 10;
//		List<ProfessorBoard> list = service.boardView(cPage, numPerPage);
//		int totalData = service.selectBoardCount();
		Professor p = (Professor) session.getAttribute("loginMember");
		String deptCode = p.getDeptCode();
		// sim 은 학과생 검색 조건들을 담은 객체. SelectInMajor 화면으로부터 정보를 받아서 객체로 생성.
		// 학과번호로 해당 학과생들을 조회함.
		if (sim != null) {
			sim.setDeptCode(deptCode);
		} else if (sim == null) {
			sim = new SelectInMajor();
			sim.setDeptCode(deptCode);
		}
		System.out.println(sim.getDeptCode());

		// 조건 검색들로 학생 목록을 추출
		List<Student> list = service.selectInMajor(sim, cPage, numPerPage);

		int totalData = service.countInDept(sim);
		model.addAttribute("sim", sim);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalData);
		model.addAttribute("pageBar",
				PageFactory.getInMajorPageBar(totalData, cPage, numPerPage, req.getContextPath() + "/prof/viewInMajor.hd", sim));

		return "professor/stu_view_inMajor";
	}

	// 수강생 조회
	@RequestMapping("prof/viewInClass.hd")
	public String viewInClass(SelectInClass sic, HttpServletRequest req,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, Model model,
			HttpSession session) {
		int numPerPage = 5;
		Professor p = (Professor) session.getAttribute("loginMember");

		// 현재 강의중인 과목이 있는 연도 조회====
		List<String> preSubjectYear = service.selectPreSubject(p);
		if (preSubjectYear != null && !preSubjectYear.isEmpty()) {
			model.addAttribute("preSubjectList", preSubjectYear);
		} else {
			preSubjectYear.add("개설과목 없음");
			model.addAttribute("preSubjectList", preSubjectYear);
		}

		// =========현재 강의중인 과목 이름 리스트 조회=======
		List<Select_SubjectNameCode> nameCodeList = service.selectPreSubjectNameo(p);
		if (nameCodeList != null && !nameCodeList.isEmpty()) {
			model.addAttribute("nameCodeList", nameCodeList);
		} else {
			nameCodeList.add(new Select_SubjectNameCode("", "개설과목 없음"));
			model.addAttribute("nameCodeList", nameCodeList);
		}
		// 조건 검색에 따른 실 수강생 목록 조회 시작
		if (sic != null && sic.getSubCode() != null && sic.getSubYear() != null) {
			int totalData = service.countInClass(sic);

			List<InClassStudent> stuList = service.selectInClass(sic, cPage, numPerPage);

			// ============강의정보 출력==================
			Map<String, String> params = new HashMap<String, String>();
			params.put("subCode", sic.getSubCode());
			params.put("profId", p.getProfId());
			if (sic.getSubCode() != null && p.getProfId() != null) {
				Select_ClassInfo sci = service.selectClassInfo(params);

				model.addAttribute("classInfo", sci);
			}
			model.addAttribute("sic", sic);
			// =======================================
			model.addAttribute("stuList", stuList);
			model.addAttribute("totalCount", totalData);
			model.addAttribute("pageBar",
					PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/viewInClass.hd"));
		}
		return "professor/stu_view_inClass";

	}

	// 출결조회
	@RequestMapping("prof/viewClassAttend.hd")
	public String viewClassAttend(SelectAttendList sal,HttpServletRequest req , @RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession session, Model model ) {
		int numPerPage = 5;
		Professor p = (Professor) session.getAttribute("loginMember");
		sal.setProfId(p.getProfId());
		String sysdate = service.selectSysdate();
		System.out.println(sysdate.replaceAll("-", "/"));
		if(sal.getCheckDate() == null || sal.getCheckDate().equals("")) {
			sal.setCheckDate(sysdate);
		} else {
			String dateTemp = "2019/"+sal.getCheckDate().substring(0, 5);
			System.out.println(dateTemp);
			sal.setCheckDate(dateTemp);
		}
		
		
		List<Select_SubjectNameCode> subNameCodeList = service.selectPreSubjectNameo(p);
		if(subNameCodeList != null && !subNameCodeList.isEmpty()) {
			model.addAttribute("subNameCodeList", subNameCodeList);		
			
		} else {
			subNameCodeList.add(new Select_SubjectNameCode("","개설과목 없음"));
			model.addAttribute("subNameCodeList", subNameCodeList);		
		}
		
		if(sal.getSubCode() == null || sal.getSubCode().equals("")) {
			System.out.println("섭코드가 비어있네!");
			if(subNameCodeList.get(0).getSubCode() != null && !subNameCodeList.get(0).getSubCode().equals("")) {
				
				sal.setSubCode(subNameCodeList.get(0).getSubCode());
				System.out.println("리스트의 0 번째 섭코드 : "+subNameCodeList.get(0).getSubCode());
			}else {
				sal.setSubCode("");
			}
		}
		
		
		
		List<AttendStudent> attendList = service.selectAttendList(sal,cPage, numPerPage);
		if(attendList != null && !attendList.isEmpty()) {
			model.addAttribute("attendList",attendList);
		} else {
			attendList.add(new AttendStudent("조회결과 없음"));
			model.addAttribute("attendList",attendList);
		}
		int totalData = service.countAttendList(sal);
		
		///SUB_CODE 와 PROF_ID 베이스 + sal의 조건들 사용
		model.addAttribute("subNameCodeList",subNameCodeList); //() 해당 과목에 수강중인 학생의 기본정보와 출결정보 출력
		//=======================================

		//--------------페이징 처리 시작
		model.addAttribute("sal",sal);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/viewClassAttend.hd"));
		
		return "professor/stu_view_classAttend";
	}

	@RequestMapping("prof/ajax_view_attend.hd")
	@ResponseBody
	public String ajaxViewAttend(SelectAttendList sal) {
		System.out.println("sal.stuNo : "+sal.getStuNo());
		System.out.println("sal.profId : " + sal.getProfId());
		System.out.println(sal.getSubCode());
		
		
		List<AttendStudent> list = service.selectOneStuAttendList(sal);
		ObjectMapper mapper=new ObjectMapper();
		String jsonStr="";
		
		try {
			jsonStr=mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
			return jsonStr;
		
	}
	
	
	@RequestMapping("prof/insertStatus.hd")
	public String insertStatus(HttpServletRequest req,HttpSession session,Model model) {
		Professor p = (Professor) session.getAttribute("loginMember");
		String profId = p.getProfId();
		String insertSubCode = req.getParameter("insertSubCode");
		String insertDate = req.getParameter("insertDate");
		System.out.println("insertDate : "+insertDate);
		
		String[] status = req.getParameterValues("insertStatus");
		for(String s : status) {
			System.out.println(s);
		}
		
		String[] stuNo = req.getParameterValues("insertStuNo");
		for(String s : stuNo) {
			System.out.println(s);
		}
		
		int i;
		List<SelectAttendList> list = new ArrayList<SelectAttendList>();
		for(i = 0; i<stuNo.length; i++) {
			SelectAttendList sal = new SelectAttendList();
			sal.setSubCode(insertSubCode);
			sal.setCheckDate(insertDate);
			sal.setProfId(profId);
			sal.setStuNo(stuNo[i]);
			sal.setStatus(status[i]);
			if(!sal.getStatus().equals("")) {
				list.add(sal);
			}
		}
		
		int result = stuNo.length;
		int resultTemp = 0;
		
		for(SelectAttendList sal : list) {
			resultTemp = service.insertAttend(sal);
		}
		
		
		
		String msg = "";
		String loc = "/prof/viewClassAttend.hd";
		if(resultTemp != 0 ) {
			msg = "출석 입력이 성공적으로 이루어졌습니다.";
		} else {
			msg = "Error : 입력이 이루어지지 않았습니다. \n 확인후, 다시시도하세요.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	// 성적 이의신청 조회
	@RequestMapping("prof/viewObjection.hd")
	public String viewObjection(HttpServletRequest req, HttpSession session,Model model,SelectInClass sic, 
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) throws JsonProcessingException {
		Professor p = (Professor) session.getAttribute("loginMember");
		String profId = p.getProfId();
		int numPerPage = 5;
		//교수가 개강중인 강의 목록 조회
		List<Select_SubjectNameCode> nameCodeList = service.selectPreSubjectNameo(p);
		if (nameCodeList != null && !nameCodeList.isEmpty()) {
			model.addAttribute("nameCodeList", nameCodeList);
		} else {
			nameCodeList.add(new Select_SubjectNameCode("", "개설과목 없음"));
			model.addAttribute("nameCodeList", nameCodeList);
		}
		//조건을 이용해 이의신청을 조회
		sic.setProfId(profId);
		int totalData = service.countReqList(sic);
		List<Request> reqList = service.selectReqList(sic, cPage, numPerPage);
		
		model.addAttribute("reqList", reqList);
		model.addAttribute("sic",sic);
		model.addAttribute("totalCount",totalData);
		model.addAttribute("pageBar",PageFactory.getReqListPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/prof/viewClassAttend.hd",sic));
		
		return "professor/stu_view_objection";
	}
	
	//건의사항 내용 팝업창 호출
	@RequestMapping("prof/popupReqBoard")
	public String popupBoard(Model model , Request requestVo) {
		model.addAttribute("requestVo", requestVo);
		return "professor/prof_view_reqBoard";
	}
	
	@RequestMapping("prof/updateAnswer.hd")
	public String insertAnswer(Request reqVo, Model model) {
		System.out.println(reqVo.getAcaYearSem());
		System.out.println(reqVo.getProfId());
		System.out.println(reqVo.getStuNo());
		System.out.println(reqVo.getSubCode());
		int result = service.updateAnswer(reqVo);
		String msg = "";
		String loc = "/prof/viewObjection.hd";
		String function = "opener.parent.location.reload();" + 
				"window.close();" + "location.href='${pageContext.request.contextPath}${loc}';";
		if(result != 0) {
			msg = "답변이 성공적으로 등록되었습니다";
		} else {
			msg = "정상적으로 처리되지 않았습니다, 다시시도 해 주세요";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("function",function);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	/*
	 * // 성적 관리
	 * 
	 * @RequestMapping("prof/editClassResult.hd") public String editClassResult() {
	 * 
	 * return "professor/stu_edit_classResult"; }
	 */


	// 강의평가조회
	@RequestMapping("prof/view_evaluation.hd")
	public String viewEvaluation() {

		return "professor/prof_view_classEvaluation";
	}

	/*
	 * // 과제등록
	 * 
	 * @RequestMapping("prof/upAssignment.hd") public String upAssignment() {
	 * 
	 * return "professor/up_assignment"; }
	 */

//	// 과제 제출 조회
//	@RequestMapping("prof/viewAssignment.hd")
//	public String viewAssignment() {
//		
//		return "professor/view_assignment";
//	}

}
