package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoForProfAssignment {

	private String profId; // 교수 번호
	private int subSeq; // 과목 일련번호
	private int asgmtNo; // 과제 번호
	private String acaYear;
	private String acaSemester;
}
