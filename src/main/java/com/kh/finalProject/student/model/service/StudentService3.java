package com.kh.finalProject.student.model.service;

import java.util.List;

import com.kh.finalProject.student.model.vo.Student;
import com.kh.finalProject.professor.model.vo.AssignmentRegister;
import com.kh.finalProject.student.model.vo.GraduationCon;
import com.kh.finalProject.student.model.vo.MyClass;
import com.kh.finalProject.student.model.vo.MySchedule;
import com.kh.finalProject.student.model.vo.MyScheduleForInfo;
import com.kh.finalProject.student.model.vo.StuTuition;

public interface StudentService3 {
	
	StuTuition selectTuitionOne(StuTuition tuition);
	List<StuTuition> selectTuitionCertList(String studentNo);
	StuTuition selectBasicStudentInfo(String studentNo);
	int updateTuitionOne(StuTuition tuition, Student student) throws Exception;
	GraduationCon selectGraduationCon(String studentNo);
	String selectStuYearSem(String studentNo);
	List<MySchedule> selectMySchedule(MyScheduleForInfo msfi);
	List<MyClass> selectMyClassList(MyScheduleForInfo msfi);
	List<AssignmentRegister> selectAsgmtBoardList(int cPage, int numPerPage, MyScheduleForInfo msfi);
	int selectAsgmtBoardCount(MyScheduleForInfo msfi);
	AssignmentRegister selectAssignment(MyScheduleForInfo msfi, boolean hasRead);
}
