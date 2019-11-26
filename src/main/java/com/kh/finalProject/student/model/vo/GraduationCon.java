package com.kh.finalProject.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GraduationCon {

	private String stuNo;
	private int psblMajCr;
	private int myMajCr;
	private int psblLibCr;
	private int myLibCr;
	private String stuName;
	private String stuSSn;
	private String deptName;
}
