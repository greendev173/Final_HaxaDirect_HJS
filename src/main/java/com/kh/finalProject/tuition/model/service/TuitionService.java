package com.kh.finalProject.tuition.model.service;

import java.util.List;

import com.kh.finalProject.tuition.model.vo.Tuition;

public interface TuitionService {
	
	Tuition selectOne(String tuiYear,String deptCode);
	int insertTuition(Tuition t) throws Exception;
	List<Tuition> tuitionList(String tuiYear);
	List<Tuition> tuitionList();
	int tuitionUpdate(Tuition t) throws Exception;
}
