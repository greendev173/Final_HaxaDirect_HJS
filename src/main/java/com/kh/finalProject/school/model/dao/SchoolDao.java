package com.kh.finalProject.school.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.school.model.vo.College;

public interface SchoolDao {
	
	int colCount(SqlSessionTemplate session);
	int deptCount(SqlSessionTemplate session);
	List<College> colList(SqlSessionTemplate session);
	List<College> colList1(SqlSessionTemplate session);
	List<Map> deptList(SqlSessionTemplate session,int cPage, int numPerPage);
	int colInsert(SqlSessionTemplate session, College c);
	List<Department> deptList(SqlSessionTemplate session, String colCode);
	int deptInsert(SqlSessionTemplate session, Department d);
	List<Map> deptList1(SqlSessionTemplate session, String colCode);
	int deleteCol(SqlSessionTemplate session, String colCode);
	int deleteDept(SqlSessionTemplate session, String deptCode);
	int updateCol(SqlSessionTemplate session, College c);
	int updateDept(SqlSessionTemplate session, Department d);
	List<Map> subRoomUseList(SqlSessionTemplate session, Subject s);
}
