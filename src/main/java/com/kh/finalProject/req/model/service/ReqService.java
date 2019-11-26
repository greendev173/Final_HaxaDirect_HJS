package com.kh.finalProject.req.model.service;

import java.util.List;

import com.kh.finalProject.req.model.vo.Req;

public interface ReqService {
	
	int insertReq(Req req) throws Exception;
	List<Req> reqList(int index, int cPage, int numPerPage);
	int selectReqCount(int index);
	Req reqOne(int reqNo);
	int answerUpdate(int reqNo);
	List<Req> reqSendList(String userId,Boolean flag);
}
