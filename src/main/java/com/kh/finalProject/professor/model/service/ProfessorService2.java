package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

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

public interface ProfessorService2 {
	//서버의 현재 날짜 조회
	String selectSysdate();
	
	
	
	Professor selectOne(String loginId,String loginPwd);
	//학과생 조회=====
	List<Student> selectInMajor(SelectInMajor sim, int cPage, int numPerPage);
	int countInDept(SelectInMajor sim);
	//==============
	
	//개설된 강의들의 연도 중복제거하여 조회
	List<String> selectPreSubject(Professor p);
	
	//개설된 강의들의 이름 중복  제거하여 조회
	List <Select_SubjectNameCode> selectPreSubjectNameo(Professor p);
	
	//수강생을 조건(sic)에 따라 조회 ============
	List <InClassStudent> selectInClass(SelectInClass sic, int cPage, int numPerPage);
	int countInClass(SelectInClass sic);
	
	Select_ClassInfo selectClassInfo(Map<String,String> map);
	
	List<AttendStudent> selectAttendList(SelectAttendList sal, int cPage, int numPerPage);
	
	int countAttendList(SelectAttendList sal);
	
	List<AttendStudent> selectOneStuAttendList(SelectAttendList sal);
	
	int insertAttend(SelectAttendList sal);
	
	List<Request> selectReqList(SelectInClass sic , int cPage, int numPerPage);
	
	int countReqList(SelectInClass sic);
	
	int updateAnswer(Request req);
	
}
