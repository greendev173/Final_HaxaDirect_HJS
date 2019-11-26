package com.kh.finalProject.student.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.student.model.vo.Student;

public interface StudentDao {
	
	Student selectOne(SqlSessionTemplate session, String loginPwd);
	Student stuIdSearch(SqlSessionTemplate session,Student s);
	int stuPwChange(SqlSessionTemplate session, String stuPw,String stuNo);
}
