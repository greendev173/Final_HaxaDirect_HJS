package com.kh.finalProject.professor.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProfessorBoard {
	private int profBoardNo;
	private String profName;
	private String profBoardType;
	private String profBoardTitle;
	private String profBoardContent;
	private String profOrifilename;
	private String profRefilename;
	private Date profBoardDate;
	private String profId;
}
