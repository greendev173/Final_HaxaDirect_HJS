package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;




@Data
@NoArgsConstructor
@AllArgsConstructor
public class SelectAttendList {
	private String profId;
	private String subCode;
	private String checkDate;
	private String stuName;
	private String grade;
	private String deptName;
	private String sysdate;
	private String status;
	//ajax용 변수
	private String stuNo;
	
}
