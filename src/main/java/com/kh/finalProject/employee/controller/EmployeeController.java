package com.kh.finalProject.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.beforeStudent.model.service.BeforeStuService;
import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.common.encrypt.MyEncrypt;
import com.kh.finalProject.common.encrypt.Sha256Encrypto;
import com.kh.finalProject.email.controller.MailController;
import com.kh.finalProject.employee.model.service.EmployeeService;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.common.PageFactory;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.req.model.vo.Req;
import com.kh.finalProject.student.model.vo.Student;

@Controller
public class EmployeeController {

	@Autowired
	MailController handler;
	@Autowired
	private MyEncrypt enc;
	@Autowired
	private EmployeeService service;
	@Autowired
	BCryptPasswordEncoder bEnc;
	@Autowired
	BeforeStuService bService;

	static Map<Object, Integer> count = new HashMap<Object, Integer>();

	@RequestMapping("/enrollStudent.hd")
	public ModelAndView enrollStudent() {
		ModelAndView mv = new ModelAndView();

		List<?> list = service.enrollStuList();
		mv.setViewName("admin/enrollStudent");
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("insertNewStu.do")
	@ResponseBody
	public int insertNewStu(@RequestParam int beforeStu, HttpServletRequest req) {
		BeforeStu bs = service.selectBeforeStu(beforeStu);
		Student s = settingNewStudent(bs);
		if (Integer.parseInt(s.getStuNo().substring(8, 10)) > 50) {
			try {
				int result = bService.deleteBstuList(s.getDeptCode());
				handler.forSendEmail(s.getStuEmail(), "KH 대학교 입학 관현안내",
						s.getStuName() + "님의 입학 신청 결과 정원초과로 입학이 불가능하다는 것을 알립니다.", req);
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}

			return beforeStu;

		}

		try {
			int result = service.insertNewStu(s, beforeStu);
			handler.forSendEmail(s.getStuEmail(), "KH 대학교에 입학 하신것을 축하드려요!",
					"아이디 : " + s.getStuNo() + "   \r\n    비밀번호 : " + enc.decrypt(s.getStuSsn() + "").substring(0, 6)
							+ " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.",
					req);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return beforeStu;
	}

	// 교수 등록 삭제 리스트
	@RequestMapping("/enrollprofessor.hd")
	public ModelAndView enrollprofrssor(
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Professor> list = service.selectProfList(cPage, numPerPage, null);
		int totalData = service.profCount(null);
		mv.setViewName("admin/enrollProfessor");
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",
				PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/enrollprofessor.hd"));
		return mv;
	}

	@RequestMapping("/changeProfessor.hd")
	public ModelAndView changeProfessor(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			String deptCode, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		List<Professor> list = service.changeProfessor(cPage, numPerPage, deptCode);
		int totalData = service.changeProfessorCount(deptCode);
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",
				PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/changeProfessor.hd"));
		mv.setViewName("admin/enrollProfessor");
		return mv;
	}

	// 직원
	@RequestMapping("/enrollemployee.hd")
	public ModelAndView enrollemployee(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Employee> list = service.selectEmpList(cPage, numPerPage, "0");
		int totalData = service.empListCount("0");
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar",
				PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/enrollemployee.hd"));
		mv.setViewName("admin/enrollEmp");
		return mv;
	}

	@RequestMapping("/employee/insertEmp.hd")
	public String insertEmp(Employee emp, HttpServletRequest req) {
		String msg = "";
		String loc = "";
		Employee e = settingNewEmployee(emp);
		try {
			int result = service.insertNewEmp(e);
			handler.forSendEmail(e.getEmail(), "KH 대학교에 근무 하게 된 것을 축하드려요!",
					"아이디 : " + e.getEmpId() + "   \r\n    비밀번호 : " + (enc.decrypt(e.getEmpSsn()+"").substring(0, 6))
							+ " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.",
					req);
			loc = "/enrollemployee.hd";
			msg = "직원 등록 성공!";
		} catch (Exception x) {
			loc = "/enrollemployee.hd";
			msg = "직원 등록 실패!";
		}
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		session.setAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/professor/insertProf.hd")
	public String insertProf(Professor p, HttpServletRequest req) {
		String msg = "";
		String loc = "";
		Professor prof = settingNewProfessor(p);
		try {
			int result = service.insertNewProf(prof);
			handler.forSendEmail(prof.getEmail(), "KH 대학교에 근무 하게 된 것을 축하드려요!",
					"아이디 : " + prof.getProfId() + "   \r\n    비밀번호 : "
							+ (enc.decrypt(prof.getProfSsn()) + "").substring(0, 6)
							+ " 입니다 .  \r\n 최초 로그인 이후 비밀번호를 수정해 주세요.",
					req);
			msg = "교수 등록 성공!";
			loc = "/enrollprofessor.hd";
		} catch (Exception x) {
			msg = "교수 등록실패!";
			loc = "/enrollprofessor.hd";
		}
		HttpSession session = req.getSession();
		session.setAttribute("msg", msg);
		session.setAttribute("loc", loc);

		return "common/msg";
	}

	@RequestMapping("/deleteEmployee.hd")
	public String deleteProf(@RequestParam int num) {

		return "";
	}

	@RequestMapping("/col/colList.hd")
	public ModelAndView moveColList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/colList");
		return mv;
	}

	@RequestMapping("/col/changeColList.hd")
	@ResponseBody
	public Map<String, Object> changeColList(
			@RequestParam(value = "index", required = false, defaultValue = "0") int index,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession s, HttpServletRequest req) {
		Employee e = (Employee) s.getAttribute("loginMember");
		int numPerPage = 5;
		String result = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode().substring(0, 1);
		if (index == 0) {
			List<?> list = service.selectStuList(cPage, numPerPage, result);
			int totalData = service.stuCount(result);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getAjaxPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/changeColList.hd"));
			return map;
		} else if (index == 1) {
			List<?> list = service.selectProfList(cPage, numPerPage, result);
			int totalData = service.profCount(result);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getAjaxPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/changeColList.hd"));
			return map;
		} else {
			List<?> list = service.selectEmpList(cPage, numPerPage, result);
			int totalData = service.empListCount(result);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getAjaxPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/changeColList.hd"));
			return map;
		}
	}

	@RequestMapping("/col/searchColList.hd")
	@ResponseBody
	public Map<String, Object> searchColList(
			@RequestParam(value = "index", required = false, defaultValue = "0") int index,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, String search,
			HttpSession s, HttpServletRequest req) {
		int numPerPage = 5;
		if (index == 0) {
			List<Student> list = service.searchStuList(cPage, numPerPage, search);
			int totalData = service.searchstuCount(search);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getSearchNavPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/searchColList.hd"));
			return map;
		} else if (index == 1) {
			List<Professor> list = service.searchProfList(cPage, numPerPage, search);
			int totalData = service.searchProfCount(search);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getSearchNavPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/searchColList.hd"));
			return map;
		} else {
			List<Employee> list = service.searchEmpList(cPage, numPerPage, search);
			int totalData = service.searchEmpCount(search);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageBar", PageFactory.getSearchNavPageBar(index, totalData, cPage, numPerPage,
					req.getContextPath()+"/col/searchColList.hd"));
			return map;
		}
	}

	@RequestMapping("/deptStu")
	public ModelAndView deptStu(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String search, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode().substring(0, 1);
		String s = search.equals("") ? null : search;
		map.put("deptCode", deptCode);
		map.put("search", s);
		List<Student> list = service.deptStu(cPage, numPerPage, map);
		int totalData = service.deptStuCount(map);
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/deptStu.hd"));
		mv.setViewName("admin/deptStu");
		return mv;

	}

	@RequestMapping("/ajax/deptStu")
	@ResponseBody
	public Map<String, Object> ajaxDeptStu(
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String search, HttpSession session, HttpServletRequest req) {
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode();
		String s = search.equals("") ? null : search;
		map.put("deptCode", deptCode);
		map.put("search", s);
		List<Student> list = service.deptStu(cPage, numPerPage, map);
		int totalData = service.deptStuCount(map);
		map.put("list", list);
		map.put("cPage", cPage);
		map.put("pageBar", PageFactory.getSearchPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/ajax/deptStu"));
		return map;
	}

	@RequestMapping("/deptPro.hd")
	public ModelAndView deptPro(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode();
		List<Professor> list = service.changeProfessor(cPage, numPerPage, deptCode);
		int totalData = service.changeProfessorCount(deptCode);
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/deptPro.hd"));
		mv.setViewName("admin/deptPro");
		return mv;
	}

	@RequestMapping("/ajax/deptProf")
	@ResponseBody
	public Map<String, Object> ajaxDeptProf(
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String search, HttpSession session, HttpServletRequest req) {
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode();
		String s = search.equals("") ? null : search;
		map.put("deptCode", deptCode);
		map.put("search", s);
		List<Employee> list = service.deptProf(cPage, numPerPage, map);
		int totalData = service.deptProfCount(map);
		map.put("list", list);
		map.put("cPage", cPage);
		map.put("pageBar", PageFactory.getSearchPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/ajax/deptProf"));
		return map;
	}

	@RequestMapping("/deptEmp.hd")
	public ModelAndView deptEmp(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String search, HttpSession session, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode().substring(0, 1);
		String s = search.equals("") ? null : search;
		map.put("deptCode", deptCode);
		map.put("search", s);
		List<Employee> list = service.deptEmp(cPage, numPerPage, map);
		int totalData = service.deptEmpCount(map);
		mv.addObject("list", list);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/deptStu.hd"));
		mv.setViewName("admin/deptEmp");
		return mv;

	}

	@RequestMapping("/ajax/deptEmp")
	@ResponseBody
	public Map<String, Object> ajaxDeptEmp(
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "search", required = false, defaultValue = "") String search, HttpSession session, HttpServletRequest req) {
		int numPerPage = 5;
		Employee e = (Employee) session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<String, Object>();
		String deptCode = e.getDeptCode().substring(0, 1).equals("0") ? null : e.getDeptCode();
		String s = search.equals("") ? null : search;
		map.put("deptCode", deptCode);
		map.put("search", s);
		List<Employee> list = service.deptEmp(cPage, numPerPage, map);
		int totalData = service.deptEmpCount(map);
		map.put("list", list);
		map.put("cPage", cPage);
		map.put("pageBar", PageFactory.getSearchPageBar(totalData, cPage, numPerPage, req.getContextPath()+"/ajax/deptStu"));
		return map;
	}

	// 학과 코드랑
	public Map<Object, Integer> settingStudentNumber(String deptCode) {
		int deptCount = service.selectDeptCount(deptCode);
		List<Map> colList = bService.selectColList();
		for (Map<?, ?> col : colList) {
			List<Map> deptList = bService.selectDeptList((String) col.get("COL_CODE"));
			for (int i = 0; i < deptList.size(); i++) {
				if (count.containsKey(deptList.get(i).get("DEPT_CODE"))) {
					if (deptCode.equals(deptList.get(i).get("DEPT_CODE")) && deptCount != 0) {
						int lastNum = service.selectLastNum(deptCode);
						count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
					} else {
						count.put(deptList.get(i).get("DEPT_CODE"), +1);
					}
				} else {
					if (deptCode.equals(deptList.get(i).get("DEPT_CODE")) && deptCount != 0) {
						int lastNum = service.selectLastNum(deptCode);
						count.put(deptList.get(i).get("DEPT_CODE"), lastNum + 1);
					} else {
						count.put(deptList.get(i).get("DEPT_CODE"), 1);
					}
				}
			}

		}
		return count;
	}

	public Student settingNewStudent(BeforeStu bs) {

		Student s = new Student();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		Map<Object, Integer> sMap = settingStudentNumber(bs.getBeforeDeptCode());
		int stuNum = (int) sMap.get(bs.getBeforeDeptCode());
		String stuNo = "S" + sysdate.substring(0, 4) + bs.getBeforeDeptCode() + String.format("%03d", stuNum);
		s.setStuNo(stuNo);
		s.setStuName(bs.getBeforeName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			s.setStuPw(enc.decrypt(bs.getBeforeNo()).substring(0, 6));
			// 패스워드 초기 패스워드 단방향 암호화함
			s.setStuPw(bEnc.encode(s.getStuPw()));

			// 성별땜에
			bs.setBeforeNo(enc.decrypt(bs.getBeforeNo()));
			// 성별 설정
			s.setGender(bs.getBeforeNo().substring(6, 7).equals("1") || bs.getBeforeNo().substring(6, 7).equals("3")
					? "남"
					: bs.getBeforeNo().substring(6, 7).equals("2") || bs.getBeforeNo().substring(6, 7).equals("4") ? "여"
							: "");

			// 다시 암호화
			bs.setBeforeNo(enc.encrypt(bs.getBeforeNo()));

		} catch (Exception e) {
			e.printStackTrace();
		}
		s.setStuTel(bs.getBeforePhone());
		s.setStuAddr(bs.getBeforeAddr());
		s.setStuSsn(bs.getBeforeNo());
		s.setDeptCode(bs.getBeforeDeptCode());
		s.setStuEmail(bs.getBeforeEmail());
		s.setRegStatus("재학");
//s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-1" : "미정");
		s.setStuYearSem(bs.getBeforeType().equals("정시") || bs.getBeforeType().equals("수시") ? "1-0" : "3-0");
		return s;
	}

	public Employee settingNewEmployee(Employee e) {
		Employee emp = new Employee();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		int empNum = service.selectEmpLastNum(e.getDeptCode());
		String empNo = "E" + sysdate.substring(0, 4) + e.getDeptCode() + String.format("%02d", empNum + 1);
		emp.setEmpId(empNo);
		emp.setEmpName(e.getEmpName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			emp.setEmpPw(e.getEmpSsn().substring(0, 6));
			// 패스워드 초기 패스워드 암호화함
			emp.setEmpPw(bEnc.encode((e.getEmpSsn() + "").substring(0, 6)));
			// 성별땜에
			// 성별 설정
			emp.setGender(e.getEmpSsn().substring(6, 7).equals("1") || e.getEmpSsn().substring(6, 7).equals("3") ? "남"
					: e.getEmpSsn().substring(6, 7).equals("2") || e.getEmpSsn().substring(6, 7).equals("4") ? "여"
							: "");

			// 다시 암호화
			emp.setEmpSsn(enc.encrypt(e.getEmpSsn()));

		} catch (Exception x) {
			x.printStackTrace();
		}
		emp.setPhone(e.getPhone());
		emp.setAddress(e.getAddress());
		emp.setDeptCode(e.getDeptCode());
		emp.setEmail(e.getEmail());
		return emp;
	}

	public Professor settingNewProfessor(Professor p) {
		Professor prof = new Professor();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(date);
		int profNum = service.selectProfLastNum(p.getDeptCode());
		String rofNo = "P" + sysdate.substring(0, 4) + p.getDeptCode() + String.format("%02d", profNum + 1);
		prof.setProfId(rofNo);
		prof.setProfName(p.getProfName());
		try {
			// 암호화된 주민등록번호 디코딩해서 생년월일만 패스워드로 저장함
			prof.setProfPw(p.getProfSsn().substring(0, 6));
			// 패스워드 초기 패스워드 암호화함
			prof.setProfPw(bEnc.encode(prof.getProfPw()));
			// 성별땜에
			// 성별 설정
			prof.setGender(
					p.getProfSsn().substring(6, 7).equals("1") || p.getProfSsn().substring(6, 7).equals("3") ? "남"
							: p.getProfSsn().substring(6, 7).equals("2") || p.getProfSsn().substring(6, 7).equals("4")
									? "여"
									: "");

			// 다시 암호화
			prof.setProfSsn(enc.encrypt(p.getProfSsn()));

		} catch (Exception x) {
			x.printStackTrace();
		}
		prof.setPhone(p.getPhone());
		prof.setAddress(p.getAddress());
		prof.setDeptCode(p.getDeptCode());
		prof.setEmail(p.getEmail());

		return prof;
	}

}
