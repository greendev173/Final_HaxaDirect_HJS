package com.kh.finalProject.professor.model.vo;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AssignmentRegister {

	private String profName; // 교수 이름
	private String subName; // 과목 이름
	private int asgmtSeq; // 과제 일련번호
	private String subSeq; // 과목 일련번호
	private String profId; // 교수 번호
	private int asgmtNo; // 과제 번호
	private String asgmtRegdTitle; // 과제 제목
	private String asgmtRegdContent; // 과제 내용
	private Date asgmtRegdDate; // 과제 올린 날짜
	// private String asgmtRegdDateStr; // 과제 올린 날짜 String 타입
	private int readCount; // 조회수
	private String asgmtRegdOrifileName; // 과제 첨부파일(업로드한 첨부파일명)
	private String asgmtRegdRefileName; // 과제 첨부파일(서버에 저장된 첨부파일명)
}
