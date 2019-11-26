package com.kh.finalProject.professor.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.Professor;

@Repository
public class ProfessorDaoImpl implements ProfessorDao {

	@Override
	public Professor selectOne(SqlSessionTemplate session, String loginId) {
		Professor pro=new Professor();
		pro.setProfId(loginId);
		return session.selectOne("professor.selectOne", pro);
	}

	@Override
	public Map empIdSearchModal(SqlSessionTemplate session, Map map) {
		return session.selectOne("school.empIdSearchModal",map);
	}
	
	
	

}
