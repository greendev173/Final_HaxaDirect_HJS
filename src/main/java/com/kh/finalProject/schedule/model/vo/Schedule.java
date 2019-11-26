package com.kh.finalProject.schedule.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Schedule {

	
	
	private int planNo;
	private String planName;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private String stDate;
//	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private String enDate;
	private String deptCode;
	private String deptName;
}
