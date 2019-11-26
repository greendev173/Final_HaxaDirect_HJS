package com.kh.finalProject.student.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InfoForSearchGrade {

	private String stuNo; // 학생 아이디
	private String acaYearSem; // 학년도 학기(예:2019-1(2019학년도 1학기))
}
