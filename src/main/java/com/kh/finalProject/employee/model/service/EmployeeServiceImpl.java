package com.kh.finalProject.employee.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.dao.EmployeeDao;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Employee selectOne(String loginId) {
		Employee emp=dao.selectOne(session,loginId);
		return emp;
	}

	@Override
	public List enrollStuList() {
		return dao.enrollStuList(session);
	}

	@Override
	public BeforeStu selectBeforeStu(int beforeStu) {
		return dao.selectBeforeStu(session, beforeStu);
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertNewStu(Student s, int beforeStu) throws Exception {
		int result = dao.deleteBeforeStu(session, beforeStu);
		int result1 = dao.insertNewStu(session, s);
		if(result1 == 0 || result1 == 0) {
			new Exception();
		}
		return result1;
	}

	@Override
	public int selectLastNum(String deptCode) {
		return dao.selectLastNum(session, deptCode);
	}

	@Override
	public int selectDeptCount(String deptCode) {
		return dao.selectDeptCount(session, deptCode);
	}

	@Override
	public List<Professor> selectProfList(int cPage, int numPerPage, String colCode) {
		return dao.selectProfList(session, cPage, numPerPage, colCode);
	}

	@Override
	public int profCount( String colCode) {
		return dao.profCount(session, colCode);
	}

	@Override
	public List<Professor> changeProfessor(int cPage, int numPerPage, String deptCode) {
		return dao.changeProfessor(session, cPage, numPerPage, deptCode);
	}

	@Override
	public int changeProfessorCount(String deptCode) {
		return dao.changeProfessorCount(session, deptCode);
	}

	@Override
	public List<Employee> selectEmpList(int cPage, int numPerPage, String colCode) {
		return dao.selectEmpList(session, cPage, numPerPage, colCode);
	}

	@Override
	public int empListCount( String colCode) {
		return dao.empListCount(session, colCode);
	}

	@Override
	public int selectEmpLastNum(String deptCode) {
		return dao.selectEmpLastNum(session, deptCode);
	}

	@Override
	public int insertNewEmp(Employee e) {
		return dao.insertNewEmp(session, e);
	}

	@Override
	public int empLastNumCheck(String deptCode) {
		return dao.empLastNumCheck(session, deptCode);
	}

	@Override
	public int selectProfLastNum(String deptCode) {
		return dao.selectProfLastNum(session, deptCode);
	}

	@Override
	public int insertNewProf(Professor p) {
		return dao.insertNewProf(session, p);
	}

	@Override
	public List<Student> selectStuList(int cPage, int numPerPage, String colCode) {
		return dao.selectStuList(session, cPage, numPerPage, colCode );
	}

	@Override
	public int stuCount(String colCode) {
		return dao.stuCount(session, colCode);
	}

	@Override
	public List<Student> deptStu(int cPage, int numPerPage, Map map) {
		return dao.deptStu(session, cPage, numPerPage, map );
	}

	@Override
	public int deptStuCount(Map map) {
		return dao.deptStuCount(session, map);
	}

	@Override
	public List<Employee> deptProf(int cPage, int numPerPage, Map map) {
		return dao.deptProf(session, cPage, numPerPage, map);
	}

	@Override
	public int deptProfCount(Map map) {
		return dao.deptProfCount(session, map);
	}

	@Override
	public List<Employee> deptEmp(int cPage, int numPerPage, Map map) {
		return dao.deptEmp(session, cPage, numPerPage, map);
	}

	@Override
	public int deptEmpCount(Map map) {
		return dao.deptEmpCount(session, map);
	}

	@Override
	public List<Student> searchStuList(int cPage, int numPerPage, String search) {
		return dao.searchStuList(session, cPage, numPerPage, search);
	}

	@Override
	public int searchstuCount(String search) {
		return dao.searchstuCount(session, search);
	}

	@Override
	public List<Professor> searchProfList(int cPage, int numPerPage, String search) {
		return dao.searchProfList(session, cPage, numPerPage, search);
	}
	@Override
	public int searchProfCount(String search) {
		return dao.searchProfCount(session, search);
	}

	@Override
	public List<Employee> searchEmpList(int cPage, int numPerPage, String search) {
		return dao.searchEmpList(session, cPage, numPerPage, search);
	}

	@Override
	public int searchEmpCount(String search) {
		return dao.searchEmpCount(session, search);
	}
	
		
	
	
	
	
	
	
	

}
