package com.kh.finalProject.professor.model.service;

import java.util.Map;

import com.kh.finalProject.professor.model.vo.Professor;

public interface ProfessorService {
	
	Professor selectOne(String loginId);
	Map empIdSearchModal(Map map);
}
