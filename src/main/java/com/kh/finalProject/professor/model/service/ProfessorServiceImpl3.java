package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.dao.ProfessorDao3;

@Service
public class ProfessorServiceImpl3 implements ProfessorService3{

	
	@Autowired
	private ProfessorDao3 dao;
	@Autowired
	private SqlSessionTemplate session;

	
	
	
	@Override
	public List<Map> gradeEdit(String profId,int cPage,int numPerPage) {
		
		return dao.gradeEdit(session,profId,cPage,numPerPage);
	}

	
	



	@Override
	public int countAllStudent(String profId) {
		
		return dao.countAllStudent(session,profId);
	}






	@Override
	public int countChoiceStudent(Map<String, Object> param) {
		
		return dao.countChoiceStudent(session,param);
	}






	@Override
	public List<Map> choiceClass(Map<String, Object> param,int cPage,int numPerPage) {
	
		return dao.choiceClass(session,param,cPage,numPerPage);
		
	}


	
	


	@Override
	public Map<String,Object> gradeFlag(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.gradeFlag(session,param);
	}




	@Override
	public int firstGrade(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.firstGrade(session,param);
	}




	@Override
	public Map<String,Object> stuInsertScore(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.stuInsertScore(session,param);
	}




	@Override
	public int updatePoint(Map<String,Object> param) {
		
		return dao.updatePoint(session,param);
	}




	@Override
	public List<Map> studyList(String profId) {
		
		return dao.studyList(session,profId);
	}


	


	@Override
	public List<Map> acasemList(String profId) {
		// TODO Auto-generated method stub
		return dao.acasemList(session,profId);
	}




	@Override
	public Map<String, Object> checkInPw(String profId) {
		// TODO Auto-generated method stub
		return dao.checkInPw(session,profId);
	}




	@Override
	public Map<String, Object> stuGrade(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.stuGrade(session,param);
	}




	@Override
	public Map<String, Object> stuMany(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.stuMany(session,param);
	}




	@Override
	public int totalGradeNull(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.totalGradeNull(session,param);
	}




	
	
	
	
	
	
	
	
	
	

}
