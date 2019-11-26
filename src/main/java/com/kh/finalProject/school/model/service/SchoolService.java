package com.kh.finalProject.school.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.school.model.vo.College;

public interface SchoolService {
	
	int colCount();
	int deptCount();
	List<College> colList();
	List<College> colList1();
	List<Map> deptList(int cPage, int numPerPage);
	List<Department> deptList(String colCode);
	int colInsert(College c);
	int deptInsert(Department d) throws Exception;
	List<Map> deptList1(String colCode);
	int deleteCol(String colCode);
	int deleteDept(String deptCode);
	int updateCol(College c);
	int updateDept(Department d);
	List<Map> subRoomUseList(Subject s);
}
