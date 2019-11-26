package com.kh.finalProject.employee.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.employee.model.vo.NoticeAttachment;
import com.kh.finalProject.employee.model.vo.NoticeVo;


@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<NoticeVo> selectNoticeList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("noticeMapper.selectNoticeList","",row);
	}

	@Override
	public int countNoticeList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("noticeMapper.countNoticeList");
	}



	@Override
	public int insertNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		return session.insert("noticeMapper.insertNotice", noticeVo);
	}
	

	@Override
	public int insertNoticeAttachment(SqlSessionTemplate session, NoticeAttachment nVo) {
		return session.insert("noticeMapper.insertNoticeAttachment",nVo);
	}

	@Override
	public NoticeVo viewNoticeDetail(SqlSessionTemplate session, int noticeNo) {
		return session.selectOne("noticeMapper.viewNoticeDetail",noticeNo);
	}
	@Override
	public int updateReadCount(SqlSessionTemplate session, int noticeNo) {
		return session.update("noticeMapper.updateReadCount",noticeNo);
	}

	@Override
	public List<NoticeAttachment> selectNoticeAttachment(SqlSessionTemplate session, int noticeNo) {
		return session.selectList("noticeMapper.selectNoticeAttachment",noticeNo);
	}

	@Override
	public int updateNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(SqlSessionTemplate session, NoticeVo noticeVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
