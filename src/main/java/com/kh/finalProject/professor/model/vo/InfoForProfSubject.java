package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InfoForProfSubject {
	
	private String profId;
	private String acaYear;
	private String acaSemester;
	private String subSeq; // 과목 일련번호
}
