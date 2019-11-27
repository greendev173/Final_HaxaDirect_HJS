package com.kh.finalProject.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalProject.professor.model.vo.InfoForProfSubject;
import com.kh.finalProject.professor.model.vo.InsertClass;
import com.kh.finalProject.professor.model.vo.PlanBoard;
import com.kh.finalProject.professor.model.vo.ProfBoardAttachment;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.professor.model.vo.ProfessorBoard;
import com.kh.finalProject.professor.model.vo.Subject;

@Repository
public class ProfessorDaoImpl1 implements ProfessorDao1 {
	
	@Override
	public String selectProfName(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectProfName");
	}
	//게시판 페이징 토탈데이타
	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectBoardCount");
	}
	//강의계획서 토탈데이타
	@Override
	public int selectPlanCount(SqlSessionTemplate session) {
		return session.selectOne("professor1.selectPlanCount");
	}
	//subject 토탈데이타
	@Override
	public int selectSubjectCount(SqlSessionTemplate session, String profId) {
		return session.selectOne("professor1.selectSubjectCount",profId);
	}
	//강의 개설뷰
	@Override
	public List<InsertClass> insertSubject(SqlSessionTemplate session){
		return session.selectList("professor1.insertSubject");
	}
	//강의 개설
	@Override
	public int selectSubCode(SqlSessionTemplate session, Map<String,String> map) {
		return session.selectOne("professor1.selectSubCode",map);
	}
	@Override
	public int insertSubjectEnd(SqlSessionTemplate session, Map<String, String> map) {
		return session.insert("professor1.insertSubjectEnd",map);
	}
	@Override
	public List<InsertClass> subjectView(SqlSessionTemplate session, Map<String,String> map){
		return session.selectList("professor1.subjectView",map);
	}
	//강의 상세조회
	public Map<String,String> selectSubjectView(SqlSessionTemplate session, Map<String,String> result){
		return session.selectOne("professor1.selectSubjectView",result);
	}

//	@Override
//	public int insertClassEnd(SqlSessionTemplate session, MultipartFile upfile, Map<String, String> map) {
//		return session.insert("professor1.insertClassEnd", map);
//	}
	//강의 개설 YN
	@Override
	public int subjectYn(SqlSessionTemplate session, String subCode) {
		return session.update("professor1.subjectYn", subCode);
	}
	//교수뷰
	@Override
	public List<Subject> professorView(SqlSessionTemplate session, InfoForProfSubject ifps) {
		return session.selectList("professor1.professorView", ifps);
	}
	@Override
	public Professor selectPwd(SqlSessionTemplate session, String profId) {
		return session.selectOne("professor1.selectPwd",profId);
	}
	@Override
	public int updateProfessorEnd(SqlSessionTemplate session, Professor p) {
		
//		return session.insert("professor1.updateProfessor",profId);
		return session.update("professor1.updateProfessor",p);
		
	}
	
	@Override
	public int profUpdatePwdEnd(SqlSessionTemplate session, Map<String,String> map) {
		
		return session.update("professor1.profUpdatePwdEnd",map);
	}
	//게시판뷰
	@Override
	public List<ProfessorBoard> boardView(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.boardView",null,row);
	}
	//게시판 작성
	
	@Override
	public int insertBoardEnd(SqlSessionTemplate session,ProfessorBoard pb) {
		return session.insert("professor1.insertBoardEnd",pb);
	}
	@Override
	public int insertBoardAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.insert("professor1.insertBoardAttachment",pba);
	}
	//게시판 수정
	@Override
	public int updateBoardEnd(SqlSessionTemplate session, ProfessorBoard pb) {
		return session.update("professor1.updateBoardEnd",pb);
	}
	@Override
	public int updateAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.update("professor1.updateAttachment",pba);
	}
	//게시판 삭제
	@Override
	public int deleteBoard(SqlSessionTemplate session, ProfessorBoard pb) {
		return session.delete("professor1.deleteBoard", pb);
	}
	@Override
	public int deleteAttachment(SqlSessionTemplate session, ProfBoardAttachment pba) {
		return session.delete("professor1.deleteAttachment", pba);
	}
	//게시판 상세
	@Override
	public ProfessorBoard selectBoardView(SqlSessionTemplate session, int profBoardNo) {
		return session.selectOne("professor1.selectBoardView",profBoardNo);
	}
	//게시판 조회
	@Override
	public int updateReadCount(SqlSessionTemplate session, int profBoardNo) {
		return session.update("professor1.updateReadCount",profBoardNo);
	}
	@Override
	public List<ProfBoardAttachment> selectProfAttachment(SqlSessionTemplate session, int profBoardNo) {
		return session.selectList("professor1.selectProfAttachment",profBoardNo);
	}
//	subject
	@Override
	public List<Subject> subjectCodeView(SqlSessionTemplate session,int cPage, int numPerPage, String profId){
//		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
//		return session.selectList("professor1.subjectCodeView",profId,row);
		return session.selectList("professor1.subjectCodeView",profId);
	}
	@Override
	public Map<String,String> selectSubject(SqlSessionTemplate session, Map<String,String> param) {
		return session.selectOne("professor1.selectSubject",param);
	}
//	과목코드 눌렀을때 보이는 뷰
	@Override
	public int selectSubjectCode(SqlSessionTemplate session, String profId) {
		return session.selectOne("professor1.selectSubjectCode",profId);
	}
	//강의 계획서 게시판
	@Override
	public List<PlanBoard> planBoardView(SqlSessionTemplate session,int cPage,int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.planBoardView",null,row);
	}
	//강의 계획서 작성
	@Override
	public int insertPlanEnd(SqlSessionTemplate session, PlanBoard p) {
		return session.insert("professor1.insertPlanEnd",p);
	}
	//강의 계획서 select
	@Override
	public PlanBoard selectPlanView(SqlSessionTemplate session, int planNo) {
		return session.selectOne("professor1.selectPlanView",planNo);
	}
	//강의 계획서 수정
	@Override
	public int updatePlanEnd(SqlSessionTemplate session, Map<String,String> map) {
		return session.update("professor1.updatePlanEnd",map);
	}
	//교수 시간표
	@Override
	public List<Map<String,String>> profSchedule(SqlSessionTemplate session, String profId){
		return session.selectList("professor1.profSchedule",profId);
	}
	//교수별 시간표
	@Override
	public List<Map<String,String>> deptProfScheduleView(SqlSessionTemplate session, String deptCode){
		return session.selectList("professor1.deptProfSchedule",deptCode);
	}
	@Override
	public List<Map<String,String>> deptCodeView(SqlSessionTemplate session, String deptCode){
		return session.selectList("professor1.deptCodeView",deptCode);
	}
	//교수별 시간표 deptCode select
	@Override
	public List<Map<String,String>> selectDeptCode(SqlSessionTemplate session, String deptCode){
		return session.selectList("professor1.selectDeptCode",deptCode);
	}
	@Override
	public List<Map<String,String>> selectDeptName(SqlSessionTemplate session, String deptCode){
		return session.selectList("professor1.selectDeptName",deptCode);
	}
	//강의 자료 게시판 검색
	@Override
	public List<Map<String,String>> searchData(SqlSessionTemplate session, Map<String,String> search_){
//		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.searchData",search_);
	}
	//강의 계획서 검색
	@Override
	public List<Map<String,String>> searchPlan(SqlSessionTemplate session, Map<String,String> typing_){
		return session.selectList("professor1.searchPlan",typing_);
	}
	//교수별 강의 내역
	@Override
	public List<Map<String,String>> profPlanResult(SqlSessionTemplate session, int cPage, int numPerPage){
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor1.profPlanResult",cPage,row);
	}
	@Override
	public int totalPlanResult(SqlSessionTemplate session) {
		return session.selectOne("professor1.totalPlanResult");
	}
	//내 강의 내역
	@Override
	public List<Map<String,String>> myPlanResult(SqlSessionTemplate session, String profId){
		return session.selectList("professor1.myPlanResult",profId);
	}
	
	@Override
	public List<Subject> professorView2(SqlSessionTemplate session, String profId) {
		return session.selectList("professor1.professorView2", profId);
	}
}
