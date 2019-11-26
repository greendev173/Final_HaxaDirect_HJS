package com.kh.finalProject.req.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.req.model.vo.Req;

@Repository
public class ReqDaoImpl implements ReqDao {

	@Override
	public int insertReq(SqlSessionTemplate session, Req req) {
		return session.insert("req.insertReq",req);
	}

	@Override
	public List<Req> reqList(SqlSessionTemplate session, int index, int cPage, int numPerPage) {
		RowBounds row=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("req.reqList",index,row);
	}
	
	@Override
	public int selectReqCount(SqlSessionTemplate session,int index) {
		return session.selectOne("req.selectReqCount",index);
	}

	@Override
	public Req reqOne(SqlSessionTemplate session, int reqNo) {
		return session.selectOne("req.reqOne",reqNo);
	}

	@Override
	public int answerUpdate(SqlSessionTemplate session, int reqNo) {
		return session.update("req.answerUpdate", reqNo);
	}

	@Override
	public List<Req> reqSendList(SqlSessionTemplate session, String userId,Boolean flag) {
		List<Req> list=null;
		if(flag==true) {
			 list=session.selectList("req.reqSendList",userId);
		}else {
			 list=session.selectList("req.reqAnswerList",userId);	
		}
		return list;
	}
	
	

	
	
	
	
	
	
	

}
