package com.kh.finalProject.professor.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Professor {
	
	private String profId;
	private String profPw;
	private String profName;
	private String profSsn;
	private String deptCode;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private Date profEnroll;
	
}
