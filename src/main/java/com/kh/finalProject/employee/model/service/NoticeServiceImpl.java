package com.kh.finalProject.employee.model.service;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.employee.model.dao.NoticeDao;
import com.kh.finalProject.employee.model.vo.NoticeAttachment;
import com.kh.finalProject.employee.model.vo.NoticeVo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	SqlSessionTemplate session;

	@Autowired
	NoticeDao dao;

	@Override
	public List<NoticeVo> selectNoticeList(int cPage, int numPerPage) {
		List<NoticeVo> list = dao.selectNoticeList(session, cPage, numPerPage);
		return list;
	}

	@Override
	public int countNoticeList() {
		int result = dao.countNoticeList(session);
		return result;
	}

	@Override
	@Transactional
	public int insertNotice(NoticeVo noticeVo, List<NoticeAttachment> list) throws RuntimeException {
		int result = dao.insertNotice(session, noticeVo);

			for (NoticeAttachment nVo : list) {
				System.out.println("리스트 들어옴!!!");
				nVo.setNoticeNo(noticeVo.getBoardNo());
				result = dao.insertNoticeAttachment(session, nVo);
				if (result == 0) {
					throw new RuntimeException();
				}
			}
		return result;
	}

	
	@Override
	@Transactional
	public NoticeVo viewNoticeDetail(int noticeNo, boolean hasRead) throws RuntimeException{
		int result = 0;
		NoticeVo no = dao.viewNoticeDetail(session, noticeNo);
		if(!hasRead && no != null) {
			result = dao.updateReadCount(session, noticeNo);
			if(result == 0) {
				throw new RuntimeException();
			}
		}
		
		return no;
	}
	@Override
	public List<NoticeAttachment> selectNoticeAttachment(int noticeNo) {
		return dao.selectNoticeAttachment(session,noticeNo);
	}

	@Override
	public int updateNotice(NoticeVo noticeVo) {
		int result = dao.updateNotice(session, noticeVo);
		return result;
	}

	@Override
	public int deleteNotice(NoticeVo noticeVo) {
		int result = dao.deleteNotice(session, noticeVo);
		return result;
	}

}
