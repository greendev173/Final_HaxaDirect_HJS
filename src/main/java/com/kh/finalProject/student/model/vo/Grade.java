package com.kh.finalProject.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Grade {
	
	private String acaYearSem;
	private String subCode;
	private String subName;
	private String profId;
	/*
	 * private int mterm; private int fterm; private int assign1; private int
	 * assign2; private int assign3; private int assign4;
	 */
	private String grade;
	private String stuNo;
	private String retake;
	private int rcvCredits;
	private String subType;
	private String profName;
	private String reqDate;
	private String reqTitle;
	private String reqContent;
	private String reqAwswer;
	private String reqYn;
	
	private String evalDate;
	private String evalComment;
	private String evalPoint;
}
