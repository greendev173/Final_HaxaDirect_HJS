package com.kh.finalProject.professor.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfBoardAttachment {
	private int profBoardNo;
	private int boardFileNo;
	private String boardOrifilename;
	private String boardRefilename;
	private Date boardUploaddate;
}
