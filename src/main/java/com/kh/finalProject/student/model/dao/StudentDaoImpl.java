package com.kh.finalProject.student.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Student;

@Repository
public class StudentDaoImpl implements StudentDao {

	@Override
	public Student selectOne(SqlSessionTemplate session, String loginId) {
		Student s=new Student();
		s.setStuNo(loginId);
		return session.selectOne("student.selectOne", s);
	}

	@Override
	public Student stuIdSearch(SqlSessionTemplate session, Student s) {
		return session.selectOne("student.stuIdSearch",s);
	}

	@Override
	public int stuPwChange(SqlSessionTemplate session, String stuPw,String stuNo) {
		Student s=new Student();
		s.setStuNo(stuNo);
		s.setStuPw(stuPw);
		System.out.println(s+"asdljasdilhsajsajasijlsadljasdli");
		return session.update("student.stuPwUpdate", s);
	}
	
	
	
	
	
	

}
