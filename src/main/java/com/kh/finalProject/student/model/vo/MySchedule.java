package com.kh.finalProject.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MySchedule {
	
	private String acaYearSem; // 학년도 학기
	private String subName; // 과목 이름
	private String subDate; // 수강 요일
	private String subTime; // 수강 시간
	private String subRoom; // 강의장
	private String profName; // 교수 이름
}
