package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.employee.model.vo.NoticeAttachment;
import com.kh.finalProject.employee.model.vo.NoticeVo;

public interface NoticeDao {


	List<NoticeVo> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage);
	int countNoticeList(SqlSessionTemplate session);
	
	int insertNotice(SqlSessionTemplate session, NoticeVo noticeVo);
	int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment nVo);

	NoticeVo viewNoticeDetail(SqlSessionTemplate session, int noticeNo);
	
	int updateReadCount(SqlSessionTemplate session, int noticeNo);
	List<NoticeAttachment> selectNoticeAttachment(SqlSessionTemplate session, int noticeNo);	
	
	
	int updateNotice(SqlSessionTemplate session, NoticeVo noticeVo);

	int deleteNotice(SqlSessionTemplate session, NoticeVo noticeVo);
	
}
