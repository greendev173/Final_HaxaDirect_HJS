package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Subject {
	private int subSeq;
	private String subYear;
	private String subCode;
	private String subName;
	private String targetSubject;
	private int targetGrade;
	private int completePt;
	private int subSemester;
	private String subType;
	private String deptCode;
	private String subDate;
	private String subTime;
	private String subRoom;
}
