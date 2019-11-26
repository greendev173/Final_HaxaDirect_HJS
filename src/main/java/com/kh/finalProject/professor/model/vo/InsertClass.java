package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class InsertClass {
	private String subCode;
	
//	private String classYear;
//	
//	private String tSemester;
	private String profId;
	private String openYn;
	//총인원
	private int capacity;
	
	//현재인원 
	private int preCapa;
	
	private int assignA;
	private int assignB;
	private int assignC;
	private int assignD;
	private int mTerm;
	private int fTerm;
	
	//출석 반영 점수
	private int statusGrade;
	
	private String useBook;
	private String bookName;

	//절대평가,상대평가
	private String evaStan;
	private String openOther;
	private String clOriFileName;
	private String clReFileName;
}
