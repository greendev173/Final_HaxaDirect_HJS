package com.kh.finalProject.student.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.MyClass;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;
import com.kh.finalProject.student.model.vo.StuTuition;

@Repository
public class StudentDaoImpl3 implements StudentDao3 {

	@Override
	public StuTuition selectTuitionOne(SqlSessionTemplate session, StuTuition tuition) {
		System.out.println("selectTuitionOne, dao들어옴."+tuition);
		return session.selectOne("student3.selectTuitionOne", tuition);
	}

	@Override
	public List<StuTuition> selectTuitionCertList(SqlSessionTemplate session, String studentNo) {
		return session.selectList("student3.selectTuitionCertList", studentNo);
	}

	@Override
	public StuTuition selectBasicStudentInfo(SqlSessionTemplate session, String studentNo) {
		return session.selectOne("student3.selectBasicStudentInfo", studentNo);
	}

	@Override
	public int updateTuitionOne(SqlSessionTemplate session, StuTuition tuition) {
//		System.out.println("dao updateTuitionOne 들어옴");
		return session.update("student3.updateTuitionOne", tuition);
	}
	
	@Override
	public int updateStuYearSem(SqlSessionTemplate session, Student student) {
		return session.update("student3.updateStuYearSem", student);
	}

	@Override
	public GraduationCon selectGraduationCon(SqlSessionTemplate session, String studentNo) {
		return session.selectOne("student3.selectGraduationCon", studentNo);
	}

	@Override
	public String selectStuYearSem(SqlSessionTemplate session, String studentNo) {
		return session.selectOne("student3.selectStuYearSem", studentNo);
	}

	@Override
	public List<MySchedule> selectMySchedule(SqlSessionTemplate session, MyScheduleForInfo msfi) {
		return session.selectList("student3.selectMySchedule", msfi);
	}

	@Override
	public List<MyClass> selectMyClassList(SqlSessionTemplate session, MyScheduleForInfo msfi) {
		return session.selectList("student3.selectMyClassList", msfi);
	}

	@Override
	public List<AssignmentRegister> selectAsgmtBoardList(SqlSessionTemplate session, int cPage, int numPerPage,
			MyScheduleForInfo msfi) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage, numPerPage); // 시작위치, 범위
		System.out.println("dao.selectAsgmtBoardList 들어옴");
		return session.selectList("student3.selectAsgmtBoardList", msfi, row);
	}

	@Override
	public int selectAsgmtBoardCount(SqlSessionTemplate session, MyScheduleForInfo msfi) {
		return session.selectOne("student3.selectAsgmtBoardCount", msfi);
	}

	@Override
	public AssignmentRegister selectAssignment(SqlSessionTemplate session, MyScheduleForInfo msfi) {
		return session.selectOne("student3.selectAssignment", msfi);
	}

	@Override
	public int updateAsgmtReadCount(SqlSessionTemplate session, MyScheduleForInfo msfi) {
		return session.update("student3.updateAsgmtReadCount", msfi);
	}
	
	

}
