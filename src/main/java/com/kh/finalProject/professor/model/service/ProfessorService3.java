package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ProfessorService3 {
	//서버의 현재 날짜 조회
	
	List<Map> gradeEdit(String profId,int cPage,int numPerPage);
	List<Map> choiceClass(Map<String,Object> param,int cPage,int numPerPage);
	int countAllStudent(String profId);
	int countChoiceStudent(Map<String,Object> param);
	Map<String,Object> gradeFlag(Map<String,Object> param);
	int firstGrade(Map<String,Object> param);
	Map<String,Object> stuInsertScore(Map<String,Object> param);
	int updatePoint(Map<String,Object> param);
	List<Map> studyList(String profId);
	Map<String,Object> checkInPw(String profId);
	Map<String,Object>stuGrade(Map<String,Object> param);
	Map<String,Object>stuMany(Map<String,Object> param);
	int totalGradeNull(Map<String,Object> param);
	List<Map> acasemList(String profId);

	
}
