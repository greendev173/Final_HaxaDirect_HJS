package com.kh.finalProject.employee.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor

public class NoticeAttachment {

	private int noticeNo;
	private int noticeFileNo;
	private String oriFileName;
	private String reFileName;
	private Date noticeUploadDate;
	
	
}
