package com.kh.finalProject.professor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProfSubject {
	
	private String subSeq; // 과목 일련번호
	private String subCode; // 과목 코드
	private String profId; // 교수 아이디
	private String subName; // 과목 이름
	private String subDate; // 강의 요일
	private String subTime; // 강의 시간
}
