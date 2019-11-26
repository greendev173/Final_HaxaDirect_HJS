package com.kh.finalProject.school.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.professor.model.vo.Department;
import com.kh.finalProject.professor.model.vo.Subject;
import com.kh.finalProject.school.model.vo.College;

@Repository
public class SchoolDaoImpl implements SchoolDao {

	@Override
	public int colCount(SqlSessionTemplate session) {
		return session.selectOne("school.colCount");
	}

	@Override
	public int deptCount(SqlSessionTemplate session) {
		return session.selectOne("school.deptCount");
	}

	@Override
	public List<College> colList(SqlSessionTemplate session) {
		return session.selectList("school.colList");
	}
	
	@Override
	public List<College> colList1(SqlSessionTemplate session) {
		return session.selectList("school.colList1");
	}

	@Override
	public List<Map> deptList(SqlSessionTemplate session,int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("school.deptList",null,row);
	}

	@Override
	public int colInsert(SqlSessionTemplate session, College c) {
		return session.insert("school.colInsert", c);
	}

	@Override
	public List<Department> deptList(SqlSessionTemplate session, String colCode) {
		return session.selectList("school.deptList1",colCode);
	}

	@Override
	public int deptInsert(SqlSessionTemplate session, Department d) {
		return session.insert("school.deptInsert",d);
	}
	
	@Override
	public List<Map> deptList1(SqlSessionTemplate session, String colCode) {
		return session.selectList("school.deptList2",colCode);
	}

	@Override
	public int deleteCol(SqlSessionTemplate session, String colCode) {
		return session.update("school.deleteCol", colCode);
	}

	@Override
	public int deleteDept(SqlSessionTemplate session, String deptCode) {
		return session.update("school.deleteDept", deptCode);
	}

	@Override
	public int updateCol(SqlSessionTemplate session, College c) {
		return session.update("school.updateCol", c);
	}

	@Override
	public int updateDept(SqlSessionTemplate session, Department d) {
		return session.update("school.updateDept", d);
	}

	@Override
	public List<Map> subRoomUseList(SqlSessionTemplate session, Subject s) {
		return session.selectList("school.subRoomUseList",s);
	}
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	

	
	
	
}
















