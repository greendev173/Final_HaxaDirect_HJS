package com.kh.finalProject.beforeStudent.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

@Repository
public class BeforeStuDaoImpl implements BeforeStuDao{

	@Override
	public List<Map> selectColList(SqlSessionTemplate session) {
		return session.selectList("beforeStu.selectColList");
	}

	@Override
	public List<Map> selectDeptList(SqlSessionTemplate session, String result) {
		return session.selectList("beforeStu.selectDeptList", result);
	}

	@Override
	public int insertBeforeStudent(SqlSessionTemplate session, BeforeStu s) {
		return session.insert("beforeStu.insertBeforeStudent", s);
	}

	@Override
	public int deleteBstuList(SqlSessionTemplate session, String deptCode) {
		return session.delete("beforeStu.deleteBstuList", deptCode);
	}

	
	
	
	
	
	
	
}
