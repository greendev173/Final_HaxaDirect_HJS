package com.kh.finalProject.tuition.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.tuition.model.vo.Tuition;

public interface TuitionDao {
	
	Tuition selectOne(SqlSessionTemplate session,String tuiYear,String deptCode);
	int insertTuition(SqlSessionTemplate session,Tuition t);
	List<Tuition> tuitionList(SqlSessionTemplate session,String tuiYear);
	List<Tuition> tuitionList(SqlSessionTemplate session);
	int tuitionUpdate(SqlSessionTemplate session,Tuition t);
}
