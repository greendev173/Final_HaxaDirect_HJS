package com.kh.finalProject.professor.model.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.AttendStudent;
import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectAttendList;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_ClassInfo;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Student;


public interface ProfessorDao3 {

	
	List<Map> gradeEdit(SqlSessionTemplate session,String profId,int cPage,int numPerPage);
	List<Map> choiceClass(SqlSessionTemplate session,Map<String,Object> param,int cPage,int numPerPage);
	int countAllStudent(SqlSessionTemplate session,String profId);
	int countChoiceStudent(SqlSessionTemplate session,Map<String,Object> param);
	Map<String,Object> gradeFlag(SqlSessionTemplate session,Map<String,Object> param);
	int firstGrade(SqlSessionTemplate session, Map<String,Object> param);
	Map<String,Object> stuInsertScore(SqlSessionTemplate session,Map<String,Object> param);
	int updatePoint(SqlSessionTemplate session,Map<String,Object> param);
	List<Map> studyList(SqlSessionTemplate session,String profId);
	Map<String,Object> checkInPw(SqlSessionTemplate session,String profId);
	Map<String,Object>stuGrade(SqlSessionTemplate session,Map<String,Object> param);
	Map<String,Object>stuMany(SqlSessionTemplate session,Map<String,Object> param);
	int totalGradeNull(SqlSessionTemplate session,Map<String,Object> param);
	
	
	
	List<Map> acasemList(SqlSessionTemplate session,String profId);
	
	
}
