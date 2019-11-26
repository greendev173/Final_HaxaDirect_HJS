package com.kh.finalProject.employee.model.vo;

import java.util.Date;

import com.kh.finalProject.professor.model.vo.Professor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
	
	private String empId;
	private String empPw;
	private String empName;
	private String empSsn;
	private String deptCode;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private Date empEnroll;

}
