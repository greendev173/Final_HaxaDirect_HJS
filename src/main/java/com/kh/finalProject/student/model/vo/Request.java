package com.kh.finalProject.student.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Request {

	private String stuNo;
	private String stuName;
	private String reqDate;
	private String reqTitle;
	private String reqContent;
	private String acaYearSem;
	private String profId;
	private String subCode;
	private String reqYn;
	private String reqAnswer;
	private String profName;
}
