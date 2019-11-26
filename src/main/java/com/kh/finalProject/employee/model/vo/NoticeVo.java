package com.kh.finalProject.employee.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVo {

	
    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String boardWriter;
    private String regDate;
    private int hitCount;
//    private String oriFileName;
//    private String reFileName;
}
