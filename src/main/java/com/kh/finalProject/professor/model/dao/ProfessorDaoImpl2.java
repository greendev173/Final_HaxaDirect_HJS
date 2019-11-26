package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.AttendStudent;
import com.kh.finalProject.professor.model.vo.InClassStudent;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.SelectAttendList;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;
import com.kh.finalProject.professor.model.vo.Select_ClassInfo;
import com.kh.finalProject.professor.model.vo.Select_SubjectNameCode;
import com.kh.finalProject.student.model.vo.Request;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class ProfessorDaoImpl2 implements ProfessorDao2 {

	
	
	@Override
	public String selectSysdate(SqlSessionTemplate session) {
		return session.selectOne("selectSysdate");
	}

	@Override
	public List<Student> selectInMajor(SqlSessionTemplate session, SelectInMajor sim, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectInMajor", sim, row);
	}

	@Override
	public int countInDept(SqlSessionTemplate session, SelectInMajor sim) {
		return session.selectOne("prof2.countInDept",sim);
	}

	@Override
	public List<String> selectPreSubject(SqlSessionTemplate session, Professor p) {
		return session.selectList("prof2.selectPreSubject", p);
	}

	@Override
	public List<Select_SubjectNameCode> selectPreSubjectNameo(SqlSessionTemplate session, Professor p) {
		return session.selectList("prof2.selectPreSubjectName", p);
	}

	@Override
	public List<InClassStudent> selectInClass(SqlSessionTemplate session, SelectInClass sic, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectInClass", sic, row);
	}

	@Override
	public int countInClass(SqlSessionTemplate session, SelectInClass sic) {
		return session.selectOne("prof2.countInClass",sic);
	}

	@Override
	public Select_ClassInfo selectClassInfo(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("prof2.selectClassInfo", map);
	}

	@Override
	public List<AttendStudent> selectAttendList(SqlSessionTemplate session, SelectAttendList sal ,int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectAttendList",sal,row);
	}

	@Override
	public int countAttendList(SqlSessionTemplate session, SelectAttendList sal) {
		return session.selectOne("prof2.countAttendList",sal);
	}

	@Override
	public List<AttendStudent> selectOneStuAttendList(SqlSessionTemplate session, SelectAttendList sal) {
		return session.selectList("prof2.selectOneStuAttendList",sal);
	}

	@Override
	public int insertAttend(SqlSessionTemplate session, SelectAttendList sal) {
		return session.insert("prof2.insertAttend", sal);
	}

	@Override
	public List<Request> selectReqList(SqlSessionTemplate session, SelectInClass sic, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("prof2.selectReqList",sic,row);
	}

	@Override
	public int countReqList(SqlSessionTemplate session, SelectInClass sic) {
	
		return session.selectOne("prof2.countReqList",sic);
	}

	@Override
	public int updateAnswer(SqlSessionTemplate session, Request req) {
		return session.update("prof2.updateAnswer", req);
	}
	
	
	
	
	
	
	
	
	
	
}
