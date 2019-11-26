<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<style>
	th,td{
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#qwe">건의 내역</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#asd">답변 내역</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="qwe">
  	<div class="card">
                <div class="card-body">
                  <h4 class="card-title">건의 내역 (최신순)</h4>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th style="width:10%">번호</th>
                          <th style="width:30%">건의 제목</th>
                          <th style="width:30%; overflow:hidden;">건의 내용</th>
                          <th style="width:10%">받은 사람</th>
                          <th style="width:20%">보낸 시간</th>
                        </tr>
                      </thead>
                      <tbody>
	                      <c:forEach var="s" items="${sendList }" varStatus="v">
	                        <tr onclick="location.href='${path}/reqOne.hd?reqNo=${s.reqNo }'">
	                          <td>${v.count }</td>
	                          <td>${s.reqTitle }</td>
	                          <td>${s.reqContents }</td>
	                          <td>관리자</td>
	                          <td>${s.toTime }</td>
	                        </tr>
	                      </c:forEach>  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
  </div>
  <div class="tab-pane fade" id="asd">
	<div class="card">
                <div class="card-body">
                  <h4 class="card-title">답변 내역 (최신순)</h4>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th style="width:10%">번호</th>
                          <th style="width:30%">답변 제목</th>
                          <th style="width:30%; overflow:hidden;">답변 내용</th>
                          <th style="width:10%">보낸 사람</th>
                          <th style="width:20%">받은 시간</th>
                        </tr>
                      </thead>
                      <tbody>
	                      <c:forEach var="a" items="${answerList }" varStatus="v">
	                        <tr onclick="location.href='${path}/reqAnswerOne.hd?reqNo=${a.reqNo }'">
	                          <td>${v.count }</td>
	                          <td>${a.reqTitle }</td>
	                          <td>${a.reqContents }</td>
	                          <td>관리자</td>
	                          <td>${a.toTime }</td>
	                        </tr>
	                      </c:forEach>  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
  </div>
  
</div>
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>