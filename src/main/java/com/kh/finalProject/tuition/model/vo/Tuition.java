package com.kh.finalProject.tuition.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tuition {
	
	private String tuiYear;
	private String deptCode;
	private String tuiPay;
	private String tuiPayDate;

}
