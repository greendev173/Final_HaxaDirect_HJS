package com.kh.finalProject.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.schedule.model.vo.Schedule;

public interface ScheduleDao {

	List<Schedule> getCalendar(SqlSessionTemplate session, Map resultMap);
	
	int insertPlan(SqlSessionTemplate session, Map map);
	
	int deleteCalendar(SqlSessionTemplate session, Map map);
}
