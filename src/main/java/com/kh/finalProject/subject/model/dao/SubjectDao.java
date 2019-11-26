package com.kh.finalProject.subject.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.employee.model.vo.Curriculum;
import com.kh.finalProject.professor.model.vo.Subject;

public interface SubjectDao {
	
	List<Map> selectRoom(SqlSessionTemplate session, String roomValue);
	List<Subject> selectTime(SqlSessionTemplate session, Subject s);
	List<Map> selectCurri(SqlSessionTemplate session, String deptCode);
	int subInsert(SqlSessionTemplate session, Subject s);
	List<Subject> subAllSelect(SqlSessionTemplate session);
	List<Subject> curriSearch(SqlSessionTemplate session, Subject s);
	Curriculum subTarget(SqlSessionTemplate session,String subName);
}
