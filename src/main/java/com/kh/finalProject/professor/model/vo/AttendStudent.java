package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendStudent {
	
	public AttendStudent(String stuName){
		this.setStuName(stuName);
	}
	
	
	private String stuNo;
	private String subCode;
	private String profId;
	private String grade;
	private String subName;
	private String stuName;
	private String deptName;
	private String deptCode;
	private String acaYearSem;
	private String subYear;
	private String subSemester;
	private String attend;
	private String absent;
	private String late;
	private String ealryLeave;
	//해당 학생 전체 출석조회는 아래 두개만 이용
	private String status;
	private String atDate;
	
	

}
