package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.professor.model.dao.ProfessorDao2;
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

@Service
public class ProfessorServiceImpl2 implements ProfessorService2{
	@Autowired
	ProfessorDao2 dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public String selectSysdate() {
		String sysdate = dao.selectSysdate(session);
		return sysdate;
	}

	@Override
	public Professor selectOne(String loginId, String loginPwd) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Student> selectInMajor(SelectInMajor sim, int cPage, int numPerPage) {
		List<Student> list = dao.selectInMajor(session, sim, cPage, numPerPage);
		return list;
	}
	@Override
	public int countInDept(SelectInMajor sim) {
		int result = dao.countInDept(session,sim);
		return result;
	}

	@Override
	public List<String> selectPreSubject(Professor p) {
		List<String> list = dao.selectPreSubject(session, p);
		
		return list;
	}

	@Override
	public List<Select_SubjectNameCode> selectPreSubjectNameo(Professor p) {
		List<Select_SubjectNameCode> list = dao.selectPreSubjectNameo(session, p);
		return list;
	}

	@Override
	public List<InClassStudent> selectInClass(SelectInClass sic, int cPage, int numPerPage) {
		List<InClassStudent> list = dao.selectInClass(session, sic, cPage, numPerPage);
		return list;
	}

	@Override
	public int countInClass(SelectInClass sic) {
		int result = dao.countInClass(session, sic);
		return result;
	}

	@Override
	public Select_ClassInfo selectClassInfo(Map<String, String> map) {
		Select_ClassInfo ic = dao.selectClassInfo(session, map);
		return ic;
	}

	@Override
	public List<AttendStudent> selectAttendList(SelectAttendList sal, int cPage, int numPerPage) {
		List<AttendStudent> list = dao.selectAttendList(session , sal, cPage, numPerPage);
		return list;
	}

	@Override
	public int countAttendList(SelectAttendList sal) {
		int result = dao.countAttendList(session, sal);
		
		return result;
	}

	@Override
	public List<AttendStudent> selectOneStuAttendList(SelectAttendList sal) {
		
		List<AttendStudent> list = dao.selectOneStuAttendList(session, sal);
		return list;
	}

	@Override
	@Transactional
	public int insertAttend(SelectAttendList sal) {
		int result = dao.insertAttend(session, sal);
		
		return result;
	}

	@Override
	public List<Request> selectReqList(SelectInClass sic, int cPage, int numPerPage) {
		List<Request> list = dao.selectReqList(session, sic, cPage, numPerPage);
		
		return list;
	}

	@Override
	public int countReqList(SelectInClass sic) {

		return dao.countReqList(session, sic);
	}

	@Override
	@Transactional
	public int updateAnswer(Request req) {
		return dao.updateAnswer(session, req);
	}
	
	
	
	
	
	
	
	
	
	

}
