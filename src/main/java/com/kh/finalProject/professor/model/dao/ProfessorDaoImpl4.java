package com.kh.finalProject.professor.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.professor.model.vo.InfoForProfAssignment;
import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.ProfSubject;


@Repository
public class ProfessorDaoImpl4 implements ProfessorDao4 {

	@Override
	public List<ProfSubject> selectProfSubject(SqlSessionTemplate session, InfoForProfSubject ifps) {
		return session.selectList("prof4.selectProfSubject", ifps);
	}

	@Override
	public List<AssignmentRegister> selectAsgmtBoardList(SqlSessionTemplate session, int cPage, int numPerPage, InfoForProfSubject ifps) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage); // 시작위치, 범위
		System.out.println("dao.selectAsgmtBoardList 들어옴");
		return session.selectList("prof4.selectAsgmtBoardList", ifps, row);
	}

	@Override
	public int selectAsgmtBoardCount(SqlSessionTemplate session, InfoForProfSubject ifps) {
		return session.selectOne("prof4.selectAsgmtBoardCount", ifps);
	}

	@Override
	public AssignmentRegister selectAssignment(SqlSessionTemplate session, InfoForProfAssignment ifpa) {
		return session.selectOne("prof4.selectAssignment", ifpa);
	}

	@Override
	public int insertAssignment(SqlSessionTemplate session, AssignmentRegister ar) {
		return session.insert("prof4.insertAssignment", ar);
	}

	@Override
	public int updateAssignment(SqlSessionTemplate session, AssignmentRegister ar) {
		return session.update("prof4.updateAssignment", ar);
	}

	
	
	
	
	
	
}
