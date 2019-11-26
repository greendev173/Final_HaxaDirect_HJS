package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.dao.StudentDao3;

@Repository
public class ProfessorDaoImpl3 implements ProfessorDao3 {


	
	
	
	@Override
	public List<Map> gradeEdit(SqlSessionTemplate session,String profId,int cPage,int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof3.gradeEdit",profId);
	}

	@Override
	public List<Map> choiceClass(SqlSessionTemplate session, Map<String,Object> param,int cPage,int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof3.choiceClass",param);
	}

	
	
	@Override
	public int countAllStudent(SqlSessionTemplate session, String profId) {
		
		return session.selectOne("prof3.countAllStudent",profId);
	}
	
	

	@Override
	public int countChoiceStudent(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("prof3.countChoiceStudent",param);
	}

	@Override
	public Map<String, Object> stuInsertScore(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("prof3.stuInsertScore",param);
	}

	
	
	
	@Override
	public int firstGrade(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.insert("prof3.firstGrade",param);
	}
	
	

	@Override
	public Map<String, Object> gradeFlag(SqlSessionTemplate session, Map<String, Object> param) {
	
		return session.selectOne("prof3.gradeFlag",param);
	}

	@Override
	public int updatePoint(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.update("prof3.updatePoint",param);
	}

	@Override
	public List<Map> studyList(SqlSessionTemplate session, String profId) {
	
		return session.selectList("prof3.studyList",profId);
	}

	@Override
	public Map<String, Object> checkInPw(SqlSessionTemplate session, String profId) {
	
		return session.selectOne("prof3.checkInPw",profId);
	}

	@Override
	public Map<String, Object> stuGrade(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("prof3.stuGrade",param);
	}

	@Override
	public Map<String, Object> stuMany(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("prof3.stuMany",param);
	}

	@Override
	public int totalGradeNull(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.selectOne("prof3.totalGradeNull",param);
	}

	@Override
	public List<Map> acasemList(SqlSessionTemplate session, String profId) {
		// TODO Auto-generated method stub
		return session.selectList("prof3.acasemList",profId);
	}

	
	
	
	
	
	
	
	
	
}
