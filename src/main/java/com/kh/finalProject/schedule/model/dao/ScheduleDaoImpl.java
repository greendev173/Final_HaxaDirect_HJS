package com.kh.finalProject.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.schedule.model.vo.Schedule;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Override
	public List<Schedule> getCalendar(SqlSessionTemplate session, Map resultMap) {
		return session.selectList("cal.getCalendar", resultMap);
	}

	@Override
	public int insertPlan(SqlSessionTemplate session, Map map) {
		return session.insert("cal.insertPlan", map);
	}

	@Override
	public int deleteCalendar(SqlSessionTemplate session, Map map) {
		return session.delete("cal.deleteCalendar", map);
	}

	
	
	
	
}
