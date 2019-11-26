package com.kh.finalProject.subject.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.employee.model.vo.Curriculum;
import com.kh.finalProject.professor.model.vo.Subject;

public interface SubjectService {
	
	List<Map> selectRoom(String roomValue);
	List<Subject> selectTime(Subject s);
	List<Map> selectCurri(String deptCode);
	int subInsert(Subject s) throws Exception;
	List<Subject> subAllSelect();
	List<Subject> curriSearch(Subject s);
	Curriculum subTarget(String subName);
}
