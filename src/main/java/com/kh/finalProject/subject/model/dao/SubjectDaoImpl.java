package com.kh.finalProject.subject.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.employee.model.vo.Curriculum;
import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class SubjectDaoImpl implements SubjectDao{

	@Override
	public List<Map> selectRoom(SqlSessionTemplate session, String roomValue) {
		return session.selectList("subject.selectRoom", roomValue);
	}

	@Override
	public List<Subject> selectTime(SqlSessionTemplate session, Subject s) {
		return session.selectList("subject.selectTime",s);
	}

	@Override
	public List<Map> selectCurri(SqlSessionTemplate session, String deptCode) {
		return session.selectList("subject.selectCurri",deptCode);
	}

	@Override
	public int subInsert(SqlSessionTemplate session, Subject s) {
		return session.insert("subject.subInsert", s);
	}

	@Override
	public List<Subject> subAllSelect(SqlSessionTemplate session) {
		return session.selectList("subject.subselectAll");
	}

	@Override
	public List<Subject> curriSearch(SqlSessionTemplate session, Subject s) {
		return session.selectList("subject.curriSearch",s);
	}

	@Override
	public Curriculum subTarget(SqlSessionTemplate session, String subName) {
		System.out.println(subName);
		return session.selectOne("subject.subTarget",subName);
	}
	
	
	
	
	
	
	

}

























