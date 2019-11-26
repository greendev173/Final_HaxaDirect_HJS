package com.kh.finalProject.student.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyScheduleForInfo {

	private String stuNo;
	private String acaYear;
	private String acaSemester;
	private String subSeq;
	private String asgmtNo;
}
