package com.kh.finalProject.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.student.model.dao.StudentDao;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao dao;
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public Student selectOne(String loginId) {
		Student stu=dao.selectOne(session, loginId);
		return stu;
	}


	@Override
	public Student stuIdSearch(Student s) {
		return dao.stuIdSearch(session,s);
	}


	@Override
	public int stuPwChange(String stuPw,String stuNo) {
		return dao.stuPwChange(session, stuPw,stuNo);
	}


	
	
	

	
	
}
