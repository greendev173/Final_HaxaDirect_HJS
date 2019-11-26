package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao2;
import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.InfoForSearchGrade;
import com.kh.finalProject.student.model.vo.ProfAssess;
import com.kh.finalProject.student.model.vo.Request;

@Service
public class StudentServiceImpl2 implements StudentService2 {
	
	@Autowired
	private StudentDao2 dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Grade> selectGradeAll(InfoForSearchGrade ifsg) {
		return dao.selectGradeList(session, ifsg);
	}
	
	@Override
	public List<Map> gradeSearchSubType(InfoForSearchGrade ifsg){
		return dao.gradeSearchSubType(session, ifsg);
	}
	
	/*
	 * @Override public List<Map> gradeAYS(InfoForSearchGrade ifsg) { return
	 * dao.gradeAYS(session, ifsg); }
	 * 
	 * @Override public List<Map> gradeAvg(InfoForSearchGrade ifsg) { return
	 * dao.gradeAvg(session, ifsg); }
	 */
	@Override
	public List<Map> SemesterGrades(InfoForSearchGrade ifsg) {
		return dao.SemesterGrades(session,ifsg);
	}
	
	@Override
	public int insertAppeal(Request request) {
		return dao.insertAppeal(session,request);
	}
	
	@Override
	public int insertProfAssess(ProfAssess profassess) {
		return dao.insertProfAssess(session,profassess);
	}
	
	/*
	 * @Override public List<Request> selectRequest(){ return
	 * dao.selectRequestList(session); }
	 */

	@Override
	public List<Grade> selectGradeNow(InfoForSearchGrade ifsg) {
		return dao.selectGradeNow(session, ifsg);
	}

	@Override
	public List<Grade> selectsubType(InfoForSearchGrade ifsg) {
		return dao.selectsubType(session, ifsg);
	}

	@Override
	public List<Grade> selectsubName(InfoForSearchGrade ifsg) {
		return dao.selectsubName(session, ifsg);
	}

	@Override
	public List<Grade> selectacaYearSem(InfoForSearchGrade ifsg) {
		return dao.selectacaYearSem(session, ifsg);
	}


//	@Override
//	public List<ProfAssess> insertProfAssess(InfoForSearchGrade ifsg) {
//		return dao.insertProfAssess(session, ifsg);
//	}
//	
	




	

	

	
	
}
