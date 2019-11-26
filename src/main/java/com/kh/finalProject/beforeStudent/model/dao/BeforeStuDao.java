package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuDao {

	public List<Map> selectColList(SqlSessionTemplate session);
	
	public List<Map> selectDeptList(SqlSessionTemplate session, String result);
	
	public int insertBeforeStudent(SqlSessionTemplate session, BeforeStu s);
	
	int deleteBstuList(SqlSessionTemplate session, String deptCode);
}
