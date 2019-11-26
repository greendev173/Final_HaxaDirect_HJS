package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.InfoForSearchGrade;
import com.kh.finalProject.student.model.vo.ProfAssess;
import com.kh.finalProject.student.model.vo.Request;

public interface StudentService2 {
	
	List<Grade> selectGradeAll(InfoForSearchGrade ifsg);
	
	List<Map> gradeSearchSubType(InfoForSearchGrade ifsg);
	
	/*
	 * List<Map> gradeAYS(InfoForSearchGrade ifsg); 
	 * List<Map> gradeAvg(InfoForSearchGrade ifsg);
	 */
	List<Map> SemesterGrades(InfoForSearchGrade ifsg);
	
	int insertAppeal(Request request);
	int insertProfAssess(ProfAssess profassess);
	
	/* List<Request> selectRequest(); */
	
	
	List<Grade> selectGradeNow(InfoForSearchGrade ifsg);
	
	List<Grade> selectsubType(InfoForSearchGrade ifsg);
	List<Grade> selectsubName(InfoForSearchGrade ifsg);
	List<Grade> selectacaYearSem(InfoForSearchGrade ifsg);

//	List<ProfAssess> insertProfAssess(InfoForSearchGrade ifsg);	
}
