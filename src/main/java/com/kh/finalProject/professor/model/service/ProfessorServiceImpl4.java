package com.kh.finalProject.professor.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.professor.model.dao.ProfessorDao2;
import com.kh.finalProject.professor.model.dao.ProfessorDao4;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;

@Service
public class ProfessorServiceImpl4 implements ProfessorService4{
	 // 황준순 전용

	@Autowired
	ProfessorDao4 dao;
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<ProfSubject> selectProfSubject(InfoForProfSubject ifps) {
		return dao.selectProfSubject(session, ifps);
	}

	@Override
	public List<AssignmentRegister> selectAsgmtBoardList(int cPage, int numPerPage, InfoForProfSubject ifps) {
		return dao.selectAsgmtBoardList(session, cPage, numPerPage, ifps);
	}

	@Override
	public int selectAsgmtBoardCount(InfoForProfSubject ifps) {
		return dao.selectAsgmtBoardCount(session, ifps);
	}

	@Override
	public AssignmentRegister selectAssignment(InfoForProfAssignment ifpa) {
		return dao.selectAssignment(session, ifpa);
	}

	@Override
	public int insertAssignment(AssignmentRegister ar) {
		return dao.insertAssignment(session, ar);
	}

	@Override
	public int updateAssignment(AssignmentRegister ar) {
		return dao.updateAssignment(session, ar);
	}
	
	
	
	
	

}
