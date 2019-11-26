package com.kh.finalProject.req.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.finalProject.req.model.vo.Req;

public interface ReqDao {
	
	int insertReq(SqlSessionTemplate session,Req req);
	List<Req> reqList(SqlSessionTemplate session, int index, int cPage, int numPerPage);
	int selectReqCount(SqlSessionTemplate session,int index);
	Req reqOne(SqlSessionTemplate session,int reqNo);
	int answerUpdate(SqlSessionTemplate session,int reqNo);
	List<Req> reqSendList(SqlSessionTemplate session, String userId,Boolean flag);
}
