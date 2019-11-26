package com.kh.finalProject.employee.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

public interface EmployeeService {
	
	Employee selectOne(String loginId);

	List enrollStuList();
	
	BeforeStu selectBeforeStu(int beforeStu);
	
	int insertNewStu(Student s, int beforeStu) throws Exception;
	
	int selectLastNum(String deptCode);

	int selectDeptCount(String deptCode);
	
	List<Professor> selectProfList(int cPage, int numPerPage, String colCode);
	
	int profCount( String colCode);
	
	List<Professor> changeProfessor(int cPage, int numPerPage, String deptCode);
	
	int changeProfessorCount(String deptCode);
	
	List<Employee> selectEmpList(int cPage, int numPerPage, String colCode);
	
	int empListCount( String colCode);
	
	int selectEmpLastNum(String deptCode);
	
	int insertNewEmp(Employee e);
	
	int empLastNumCheck(String deptCode);
	
	int selectProfLastNum(String deptCode);
	
	int insertNewProf(Professor p);
	
	List<Student> selectStuList(int cPage, int numPerPage, String colCode);
	
	int stuCount(String colCode);
	
	List<Student> deptStu(int cPage, int numPerPage, Map map);
	
	int deptStuCount(Map map);
	
	List<Employee> deptProf(int cPage, int numPerPage, Map map);
	
	int deptProfCount(Map map);
	
	List<Employee> deptEmp(int cPage, int numPerPage, Map map);
	
	int deptEmpCount(Map map);
	
	List<Student >searchStuList(int cPage, int numPerPage, String search);
	
	int searchstuCount(String search);
	
	List<Professor> searchProfList(int cPage, int numPerPage, String search);
	
	int searchProfCount(String search);
	
	List<Employee> searchEmpList(int cPage, int numPerPage, String search);
	
	int searchEmpCount(String search);
	
	
	}
