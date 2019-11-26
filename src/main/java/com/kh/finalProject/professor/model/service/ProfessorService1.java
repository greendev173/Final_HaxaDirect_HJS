package com.kh.finalProject.professor.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

public interface ProfessorService1 {
	//게시판 페이징 토탈데이타
	int selectBoardCount();
	String selectProfName();
	//강의계획서 토탈데이타
	int selectPlanCount();
	//subject 토탈데이타
	int selectSubjectCount(String profId);
	//강의뷰
	List<InsertClass> insertSubject();
//	Map<String,String> insertSubjectEnd(MultipartFile upfile,Map<String, String>map) throws RuntimeException;
	//강의개설
	List<InsertClass> insertSubjectEnd(Map<String, String>map) throws RuntimeException;
	//강의 상세조회
	Map<String,String> selectSubjectView(Map<String,String> result);
	//강의개설 YN
	int subjectYn(String subCode) throws RuntimeException;
	//교수뷰
	List<Subject> professorView(String profId);
	//교수 정보수정
	int updateProfessorEnd(Professor p);
	//교수 비번변경
	Professor selectPwd(String profId);
	int profUpdatePwdEnd(Map<String,String> map);
	//게시판뷰
	List<ProfessorBoard> boardView(int cPage,int numPerPage);
	//게시판 작성
	int insertBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException;
	//게시판 수정
	int updateBoardEnd(ProfessorBoard pb, List<ProfBoardAttachment> list) throws RuntimeException;
	//게시판 삭제
	int deleteBoard(ProfessorBoard pb, ProfBoardAttachment pba) throws RuntimeException;
	//게시판select
	ProfessorBoard selectBoardView(int profBoardNo, boolean hasRead) throws RuntimeException;
	List<ProfBoardAttachment> selectProfAttachment(int profBoardNo);
	//subject조회
	List<Subject> subjectCodeView(int cPage, int numPerPage, String profId);
	Map<String,String> selectSubject(Map<String,String> param);
	//강의 계획서 게시판
	List<PlanBoard> planBoardView(int cPage, int numPerPage);
	//강의 계획서 작성
	int insertPlanEnd(PlanBoard p) throws RuntimeException;
	//강의 계획서 select
	PlanBoard selectPlanView(int planNo);
	//강의 계획서 수정
	int updatePlanEnd(Map<String,String> map) throws RuntimeException;
	//교수 스케줄
	List<Map<String,String>> profSchedule(String profId);
	//교수별 스케줄
	List<Map<String,String>> deptProfScheduleView(String deptCode);
	List<Map<String,String>> deptCodeView(String deptCode);
	//교수별 스케줄 select deptcode
	List<Map<String,String>> selectDeptCode(String deptCode);
	List<Map<String,String>> selectDeptName(String deptCode);
	//강의 자료 게시판
	List<Map<String,String>> searchData(Map<String,String> search_);
//	List<Map<String,String>> searchData(String search,int cPage, int numPerPage);
	//강의계획서 검색
	List<Map<String,String>> searchPlan(Map<String,String> typing_);
	//교수별 강의 내역
	List<Map<String,String>> profPlanResult(int cPage, int numPerPage);
	int totalPlanResult();
	//내 강의 내역
	List<Map<String,String>> myPlanResult(String profId);
}
