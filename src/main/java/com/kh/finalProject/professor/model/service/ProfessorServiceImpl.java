package com.kh.finalProject.professor.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.dao.ProfessorDao;
import com.kh.finalProject.professor.model.vo.Professor;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	
	@Autowired
	private ProfessorDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Professor selectOne(String loginId) {
		Professor pro=dao.selectOne(session, loginId);
		return pro;
	}

	@Override
	public Map empIdSearchModal(Map map) {
		return dao.empIdSearchModal(session,map);
	}
	
	
	
	

}
