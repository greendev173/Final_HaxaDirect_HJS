package com.kh.finalProject.schedule.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.schedule.model.dao.ScheduleDao;
import com.kh.finalProject.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Schedule> getCalendar(Map resultMap) {
		return dao.getCalendar(session, resultMap);
	}

	@Override
	public int insertPlan(Map map) {
		int result = dao.insertPlan(session, map);
		if(result == 0) new Exception();
		return result;
	}

	@Override
	public int deleteCalendar(Map map) throws Exception {
		int result = dao.deleteCalendar(session, map);
		if(result == 0) new Exception();
		return result;
	}

	
	
	
	
}
