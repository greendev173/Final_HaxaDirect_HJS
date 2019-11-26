package com.kh.finalProject.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;
import com.kh.finalProject.employee.model.vo.Employee;
import com.kh.finalProject.professor.model.vo.Professor;
import com.kh.finalProject.student.model.vo.Student;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Employee selectOne(SqlSessionTemplate session, String loginId) {
		Employee emp=new Employee();
		emp.setEmpId(loginId);
		return session.selectOne("employee.selectOne",emp);
	}

	@Override
	public List enrollStuList(SqlSessionTemplate session) {
		return session.selectList("beforeStu.selectList");
	}

	@Override
	public BeforeStu selectBeforeStu(SqlSessionTemplate session, int beforeStu) {
		return session.selectOne("beforeStu.selectBeforeStu", beforeStu);
	}

	@Override
	public int deleteBeforeStu(SqlSessionTemplate session, int beforeStu) {
		return session.delete("beforeStu.deleteBeforeStu", beforeStu);
	}

	@Override
	public int insertNewStu(SqlSessionTemplate session, Student s) {
		return session.insert("student.insertNewStu", s);
	}

	@Override
	public int selectLastNum(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("student.selectLastNum", deptCode);
	}

	@Override
	public int selectDeptCount(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("student.selectDeptCount", deptCode);
	}

	@Override
	public List<Professor> selectProfList(SqlSessionTemplate session, int cPage, int numPerPage, String colCode) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor.selectProfList",colCode, row);
	}

	@Override
	public int profCount(SqlSessionTemplate session, String colCode) {
		return session.selectOne("professor.profCount", colCode);
	}

	@Override
	public List<Professor> changeProfessor(SqlSessionTemplate session, int cPage, int numPerPage, String deptCode) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor.changeProfessor", deptCode, row);
	}

	@Override
	public int changeProfessorCount(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("professor.changeProfessorCount", deptCode);
	}

	@Override
	public List<Employee> selectEmpList(SqlSessionTemplate session, int cPage, int numPerPage, String colCode) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.selectEmpList", colCode, row);
	}

	@Override
	public int empListCount(SqlSessionTemplate session, String colCode) {
		return session.selectOne("employee.empListCount", colCode);
	}

	@Override
	public int selectEmpLastNum(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("employee.selectEmpLastNum", deptCode);
	}

	@Override
	public int insertNewEmp(SqlSessionTemplate session, Employee e) {
		return session.insert("employee.insertNewEmp", e);
	}

	@Override
	public int empLastNumCheck(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("employee.empLastNumCheck", deptCode);
	}

	@Override
	public int selectProfLastNum(SqlSessionTemplate session, String deptCode) {
		return session.selectOne("professor.selectProfLastNum", deptCode);
	}

	@Override
	public int insertNewProf(SqlSessionTemplate session, Professor p) {
		return session.insert("professor.insertNewProf", p);
	}

	@Override
	public List<Student> selectStuList(SqlSessionTemplate session, int cPage, int numPerPage, String colCode) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student.selectStuList", colCode, row);
	}

	@Override
	public int stuCount(SqlSessionTemplate session, String colCode) {
		return session.selectOne("student.stuCount", colCode);
	}

	@Override
	public List<Student> deptStu(SqlSessionTemplate session, int cPage, int numPerPage, Map map) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("student.deptStu", map, row);
	}

	@Override
	public int deptStuCount(SqlSessionTemplate session, Map map) {
		return session.selectOne("student.deptStuCount", map);
	}

	@Override
	public List<Employee> deptProf(SqlSessionTemplate session, int cPage, int numPerPage, Map map) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("professor.deptProf", map, row);
	}

	@Override
	public int deptProfCount(SqlSessionTemplate session, Map map) {
		return session.selectOne("professor.deptProfCount", map);
	}

	@Override
	public List<Employee> deptEmp(SqlSessionTemplate session, int cPage, int numPerPage, Map map) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.deptEmp", map, row);
	}

	@Override
	public int deptEmpCount(SqlSessionTemplate session, Map map) {
		return session.selectOne("employee.deptEmpCount", map);
	}

	@Override
	public List<Student> searchStuList(SqlSessionTemplate session, int cPage, int numPerPage, String search) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.searchStuList",search, row);
	}

	@Override
	public int searchstuCount(SqlSessionTemplate session, String search) {
		return session.selectOne("employee.searchstuCount", search);
	}

	@Override
	public List<Professor> searchProfList(SqlSessionTemplate session, int cPage, int numPerPage, String search) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.searchProfList",search, row);
	}

	@Override
	public int searchProfCount(SqlSessionTemplate session, String search) {
		return session.selectOne("employee.searchProfCount", search);
	}

	@Override
	public List<Employee> searchEmpList(SqlSessionTemplate session, int cPage, int numPerPage, String search) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("employee.searchEmpList",search, row);
	}

	@Override
	public int searchEmpCount(SqlSessionTemplate session, String search) {
		return session.selectOne("employee.searchEmpCount", search);
	}
	
	
	
	
	
	

	

}
