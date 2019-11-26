package com.kh.finalProject.professor.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlanBoard {
	private int planNo;
	private String planYear;
	private String planSemester;
	private String planSubName;
	private String planSubTime;
	private String planSubRoom;
	private String planBookName;
	private String planBookAuthor;
	private String planBookYear;
	private String planBookWhere;
	private String planWay;
	private String planGoal;
	private String profName;
	private String planTitle;
	private String planContent;
	private String planMterm;
	private String planFterm;
	private String planAssign;
	private String planStatus;
	private Date planDate;
}
