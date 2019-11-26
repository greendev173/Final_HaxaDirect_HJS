package com.kh.finalProject.student.model.vo;

import java.util.Date;

import com.kh.finalProject.professor.model.vo.Professor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
	
	private String stuNo;
	private String stuName;
	private String stuPw;
	private String stuSsn;
	private String stuTel;
	private String stuAddr;
	private String gender;
	private String deptCode;
	private Date enterDate;
	private String stuEmail;
	private String regStatus;
	private String profId;
	private String stuYearSem;
	private int maxPsbCr;
	private String conSemester;
	private String stuImgOriname;
	private String stuImgRename;
	private String stuAccount;

}
