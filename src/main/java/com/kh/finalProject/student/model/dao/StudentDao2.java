package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.InfoForSearchGrade;
import com.kh.finalProject.student.model.vo.ProfAssess;
import com.kh.finalProject.student.model.vo.Request;

public interface StudentDao2 {
	
	List<Grade> selectGradeList(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	List<Map> gradeSearchSubType(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	
	/*
	 * List<Map> gradeAYS(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	 * List<Map> gradeAvg(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	 */
	List<Map> SemesterGrades(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	
	int insertAppeal(SqlSessionTemplate session, Request request);
	int insertProfAssess(SqlSessionTemplate session, ProfAssess profassess);
	
	/* List<Request> selectRequestList(SqlSessionTemplate session); */
	
	List<Grade> selectGradeNow(SqlSessionTemplate session, InfoForSearchGrade ifsg);

	List<Grade> selectsubType(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	List<Grade> selectsubName(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	List<Grade> selectacaYearSem(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	
//	List<Grade> insertProfAssess(SqlSessionTemplate session, InfoForSearchGrade ifsg);
	
}
