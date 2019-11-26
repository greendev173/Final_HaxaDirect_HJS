package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;

public interface ProfessorDao4 {

	List<ProfSubject> selectProfSubject(SqlSessionTemplate session, InfoForProfSubject ifps);
	List<AssignmentRegister> selectAsgmtBoardList(SqlSessionTemplate session, int cPage, int numPerPage, InfoForProfSubject ifps);
	int selectAsgmtBoardCount(SqlSessionTemplate session, InfoForProfSubject ifps);
	AssignmentRegister selectAssignment(SqlSessionTemplate session, InfoForProfAssignment ifpa);
	int insertAssignment(SqlSessionTemplate session, AssignmentRegister ar);
	int updateAssignment(SqlSessionTemplate session, AssignmentRegister ar);
				
}
