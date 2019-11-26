package com.kh.finalProject.student.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Grade;
import com.kh.finalProject.student.model.vo.InfoForSearchGrade;
import com.kh.finalProject.student.model.vo.ProfAssess;
import com.kh.finalProject.student.model.vo.Request;

@Repository
public class StudentDaoImpl2 implements StudentDao2 {

	@Override
	public List<Grade> selectGradeList(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectGradeList",ifsg);
	}

	@Override
	public List<Map> gradeSearchSubType(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectGradeListSubType",ifsg);
	}
	
	/*
	 * @Override public List<Map> gradeAYS(SqlSessionTemplate session,
	 * InfoForSearchGrade ifsg) { return
	 * session.selectList("student2.gradeAYS",ifsg); }
	 * 
	 * @Override public List<Map> gradeAvg(SqlSessionTemplate session,
	 * InfoForSearchGrade ifsg) { return
	 * session.selectList("student2.gradeAvg",ifsg); }
	 */
	@Override
	public List<Map> SemesterGrades(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.SemesterGrades",ifsg);
	}
	
	@Override
	public int insertAppeal(SqlSessionTemplate session, Request request) {
		return session.insert("student2.insertRequest",request);
	}

	@Override
	public int insertProfAssess(SqlSessionTemplate session, ProfAssess profassess) {
		return session.insert("student2.insertProfAssess",profassess);
	}
	/*
	 * @Override public List<Request> selectRequestList(SqlSessionTemplate session)
	 * { return session.selectList("student2.selectRequestList"); }
	 */

	@Override
	public List<Grade> selectGradeNow(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectGradeNow", ifsg);
	}

	@Override
	public List<Grade> selectsubType(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectsubType",ifsg);
	}

	@Override
	public List<Grade> selectsubName(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectsubName",ifsg);
	}

	@Override
	public List<Grade> selectacaYearSem(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
		return session.selectList("student2.selectacaYearSem",ifsg);
	}


//	@Override
//	public List<Grade> insertProfAssess(SqlSessionTemplate session, InfoForSearchGrade ifsg) {
//		return session.insert("student2.insertProfAssess",ifsg);
//	}
//	




	
	
	
	
	
	

	
	
	

}
