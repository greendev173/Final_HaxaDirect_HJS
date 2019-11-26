package com.kh.finalProject.beforeStudent.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalProject.beforeStudent.model.vo.BeforeStu;

public interface BeforeStuService {

	List<Map> selectColList();
	
	List<Map> selectDeptList(String result);
	
	int insertBeforeStudent(BeforeStu s) throws Exception;
	
	int deleteBstuList(String deptCode) throws Exception;
}
