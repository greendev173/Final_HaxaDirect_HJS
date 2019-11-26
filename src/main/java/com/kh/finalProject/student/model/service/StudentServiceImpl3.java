package com.kh.finalProject.student.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.student.model.dao.StudentDao3;
import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.MyClass;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;
import com.kh.finalProject.student.model.vo.StuTuition;

@Service
public class StudentServiceImpl3 implements StudentService3 {
	
	@Autowired
	private StudentDao3 dao;
	@Autowired
	private SqlSessionTemplate session;


	@Override
	public StuTuition selectTuitionOne(StuTuition tuition) {
		System.out.println("selectTuitionOne: service 들어옴."+tuition);
		return dao.selectTuitionOne(session, tuition);
	}


	@Override
	public List<StuTuition> selectTuitionCertList(String studentNo) {
		return dao.selectTuitionCertList(session, studentNo);
	}


	@Override
	public StuTuition selectBasicStudentInfo(String studentNo) {
		return dao.selectBasicStudentInfo(session, studentNo);
	}


	@Override
//	@Transactional
	public int updateTuitionOne(StuTuition tuition, Student student) throws Exception {
		int result=0;
//		try {
		result=dao.updateTuitionOne(session, tuition); // 등록금 테이블에 납부일='SYSDATE', 납부상태='Y'로 업데이트
		if(result==0) throw new RuntimeException();
		result=dao.updateStuYearSem(session, student); // 학생 테이블 학년 학기 올리기
		if(result==0) throw new RuntimeException();		
//		}catch( RuntimeException e) {
//			throw new RuntimeException();
//		}
		return result;
	}


	@Override
	public GraduationCon selectGraduationCon(String studentNo) {
		return dao.selectGraduationCon(session, studentNo);
	}


	@Override
	public String selectStuYearSem(String studentNo) {
		return dao.selectStuYearSem(session, studentNo);
	}


	@Override
	public List<MySchedule> selectMySchedule(MyScheduleForInfo msfi) {
		return dao.selectMySchedule(session, msfi);
	}


	@Override
	public List<MyClass> selectMyClassList(MyScheduleForInfo msfi) {
		return dao.selectMyClassList(session, msfi);
	}


	@Override
	public List<AssignmentRegister> selectAsgmtBoardList(int cPage, int numPerPage, MyScheduleForInfo msfi) {
		return dao.selectAsgmtBoardList(session, cPage, numPerPage, msfi);
	}


	@Override
	public int selectAsgmtBoardCount(MyScheduleForInfo msfi) {
		return dao.selectAsgmtBoardCount(session, msfi);
	}


	@Override
	public AssignmentRegister selectAssignment(MyScheduleForInfo msfi, boolean hasRead) {
		AssignmentRegister ar=dao.selectAssignment(session, msfi);
		if(!hasRead && ar!=null) { // hasRead가 false(읽은 적 없을 때)일때 그리고 과제가 조회되면
			dao.updateAsgmtReadCount(session, msfi); // 조회수 올리기
		}
		return ar;
	}

	
	
}
