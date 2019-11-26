package com.kh.finalProject.student.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentService1 {
	
	
	List<Map> selectApplyClass(String stuNo);
	Student selectStudent(String studentNo);
	int studentInfoUpdate(Student s);
	List<Map> selectAllClass(String stuId,int cPage,int numPerPage);
	List<Map> selectClass(Map<String,Object>param,int cPage,int numPerPage);
	Map selectPlan();
	List<Map> myApplyClass(String stuId,int cPage,int numPerPage);
	List<Map> selectMyClass(Map<String,Object>param,int cPage,int numPerPage);
	int countAllClass(String stuId);
	int countSelectClass(Map<String,Object>param);
	Map selectProfInfo(Map<String,Object>param);
	List<Map> selectProfEval(Map<String,Object>param);
	int applyClass(Map<String,String>param);
	double averPoint(Map<String,Object>param);
	int cancelClass(Map<String,Object>param);
	List<Map> selectMyApplyClass(String stuId);
	int cancelMyClass(Map<String,Object>param);
	int countMyApplyClass(String stuId);
	int countSelectMyClass(Map<String,Object>param);
	int updatePw(Map<String,String> userInfo);
	String selectNowPw(String stuId);
	int updatePreCapa(Map<String,String> param);
	int updatePreCapaCancel(Map<String,String> param);
	Map<String,String> capacityNow(String subSeq);
	Map selectStuInfo(String stuId);
	
}
