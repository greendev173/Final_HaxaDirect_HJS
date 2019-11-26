package com.kh.finalProject.student.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProfAssess {

	private String acaYearSem;
	private String subCode;
	private String profId;
	private Date evalDate;
	private String evalComment;
	private String evalPoint;
	private String stuNo;
}
