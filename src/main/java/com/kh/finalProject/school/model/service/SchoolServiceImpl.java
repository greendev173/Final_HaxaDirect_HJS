package com.kh.finalProject.school.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.school.model.dao.SchoolDao;
import com.kh.finalProject.school.model.vo.College;

@Service
public class SchoolServiceImpl implements SchoolService {
	
	@Autowired
	private SchoolDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int colCount() {
		return dao.colCount(session);
	}

	@Override
	public int deptCount() {
		return dao.deptCount(session);
	}

	@Override
	public List<College> colList() {
		return dao.colList(session);
	}
	
	@Override
	public List<College> colList1() {
		return dao.colList1(session);
	}

	@Override
	public List<Map> deptList(int cPage, int numPerPage) {
		return dao.deptList(session,cPage,numPerPage);
	}

	@Override
	public int colInsert(College c) {
		return dao.colInsert(session, c);
	}

	@Override
	public List<Department> deptList(String colCode) {
		return dao.deptList(session, colCode);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int deptInsert(Department d) throws Exception{
		int result=dao.deptInsert(session,d);
		
		if(result==0) {
			throw new Exception();
		}
		return result;
	}
	
	@Override
	public List<Map> deptList1(String colCode) {
		return dao.deptList1(session, colCode);
	}

	@Override
	public int deleteCol(String colCode) {
		return dao.deleteCol(session, colCode);
	}

	@Override
	public int deleteDept(String deptCode) {
		return dao.deleteDept(session, deptCode);
	}

	@Override
	public int updateCol(College c) {
		return dao.updateCol(session, c);
	}

	@Override
	public int updateDept(Department d) {
		return dao.updateDept(session, d);
	}

	@Override
	public List<Map> subRoomUseList(Subject s) {
		return dao.subRoomUseList(session, s);
	}
	
	
	
	
	
	
	
	

	
	
	
	
	
	

}




