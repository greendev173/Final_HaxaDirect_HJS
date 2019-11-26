package com.kh.finalProject.tuition.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.tuition.model.dao.TuitionDao;
import com.kh.finalProject.tuition.model.vo.Tuition;

@Service
public class TuitionServiceImpl implements TuitionService {
	
	@Autowired
	private TuitionDao Dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Tuition selectOne(String tuiYear, String deptCode) {
		Tuition tui=Dao.selectOne(session, tuiYear, deptCode);
		return tui;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertTuition(Tuition t) throws Exception{
		int result=Dao.insertTuition(session,t);
		if(result==0) {
			throw new Exception();
		}
		return result;
	}

	@Override
	public List<Tuition> tuitionList() {
		return Dao.tuitionList(session);
	}

	@Override
	public List<Tuition> tuitionList(String tuiYear) {
		List<Tuition> list=Dao.tuitionList(session,tuiYear);
		return list;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int tuitionUpdate(Tuition t) throws Exception{
		int result=Dao.tuitionUpdate(session,t);
		if(result==0) {
			throw new Exception();
		}
		return result;
	}
	
	
	
	
	
	
}
