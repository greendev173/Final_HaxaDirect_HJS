package com.kh.finalProject.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

public interface EmployeeDao {
	
	Employee selectOne(SqlSessionTemplate session, String loginId);

	List enrollStuList(SqlSessionTemplate session);
	
	BeforeStu selectBeforeStu(SqlSessionTemplate session, int beforeStu);
	
	int deleteBeforeStu(SqlSessionTemplate session, int beforeStu);
	
	int insertNewStu(SqlSessionTemplate session, Student s);
	
	int selectLastNum(SqlSessionTemplate session, String deptCode);
	
	int selectDeptCount(SqlSessionTemplate session, String deptCode);
	
	List<Professor> selectProfList(SqlSessionTemplate session, int cPage, int numPerPage, String colCode);
	
	int profCount(SqlSessionTemplate session, String colCode);
	
	List<Professor> changeProfessor(SqlSessionTemplate session, int cPage, int numPerPage, String deptCode);
	
	int changeProfessorCount(SqlSessionTemplate session, String deptCode);
	
	List<Employee> selectEmpList(SqlSessionTemplate session, int cPage, int numPerPage, String colCode);
	
	int empListCount(SqlSessionTemplate session, String colCode);
	
	int selectEmpLastNum(SqlSessionTemplate session, String deptCode);
	
	int insertNewEmp(SqlSessionTemplate session, Employee e);
	
	int empLastNumCheck(SqlSessionTemplate session, String deptCode);
	
	int selectProfLastNum(SqlSessionTemplate session, String deptCode);
	
	int insertNewProf(SqlSessionTemplate session, Professor p);
	
	List<Student> selectStuList(SqlSessionTemplate session, int cPage, int numParPage, String colCode);
	
	int stuCount(SqlSessionTemplate saession, String colCode);

	List<Student> deptStu(SqlSessionTemplate session, int cPage, int numParPage, Map map);
	
	int deptStuCount(SqlSessionTemplate saession, Map map);
	
	List<Employee> deptProf(SqlSessionTemplate session, int cPage, int numParPage, Map map);
	
	int deptProfCount(SqlSessionTemplate saession, Map map);
	
	List<Employee> deptEmp(SqlSessionTemplate session, int cPage, int numParPage, Map map);
	
	int deptEmpCount(SqlSessionTemplate saession, Map map);
	

	List<Student >searchStuList(SqlSessionTemplate session, int cPage, int numPerPage, String search);
	
	int searchstuCount(SqlSessionTemplate session, String search);
	
	List<Professor> searchProfList(SqlSessionTemplate session, int cPage, int numPerPage, String search);
	
	int searchProfCount(SqlSessionTemplate session, String search);
	
	List<Employee> searchEmpList(SqlSessionTemplate session, int cPage, int numPerPage, String search);
	
	int searchEmpCount(SqlSessionTemplate session, String search);
	
}
