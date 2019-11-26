package com.kh.finalProject.tuition.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.tuition.model.vo.Tuition;

@Repository
public class TuitionDaoImpl implements TuitionDao {

	@Override
	public List<Tuition> tuitionList(SqlSessionTemplate session) {
		return session.selectList("tuition.tuitionListFirst");
	}

	@Override
	public Tuition selectOne(SqlSessionTemplate session, String tuiYear, String deptCode) {
		Tuition t=new Tuition();
		t.setTuiYear(tuiYear);
		t.setDeptCode(deptCode);
		return session.selectOne("tuition.selectOne", t);
	}

	@Override
	public int insertTuition(SqlSessionTemplate session,Tuition t) {
		return session.insert("tuition.insertTuition",t);
	}

	@Override
	public List<Tuition> tuitionList(SqlSessionTemplate session, String tuiYear) {
		return session.selectList("tuition.tuitionList", tuiYear);
	}

	@Override
	public int tuitionUpdate(SqlSessionTemplate session, Tuition t) {
		return session.update("tuition.tuitionUpdate", t);
	}
	
	
	
	
	
	
	
	

}
