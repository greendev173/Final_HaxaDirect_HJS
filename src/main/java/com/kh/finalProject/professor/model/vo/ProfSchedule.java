package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfSchedule {
	private String subDate;
	private String subCode;
	private String subName;
	private String subTime;
	private String subYear;
	private String profId;
}
