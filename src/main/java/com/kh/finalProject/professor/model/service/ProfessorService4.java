package com.kh.finalProject.professor.model.service;

import java.util.List;

import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;

public interface ProfessorService4 { // 황준순 전용
	
	List<ProfSubject> selectProfSubject(InfoForProfSubject ifps);
	List<AssignmentRegister> selectAsgmtBoardList(int cPage, int numPerPage, InfoForProfSubject ifps);
	int selectAsgmtBoardCount(InfoForProfSubject ifps);
	AssignmentRegister selectAssignment(InfoForProfAssignment ifpa);
	int insertAssignment(AssignmentRegister ar);
	int updateAssignment(AssignmentRegister ar);
}
