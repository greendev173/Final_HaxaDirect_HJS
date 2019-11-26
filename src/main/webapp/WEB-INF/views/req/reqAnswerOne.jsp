<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="com.kh.finalProject.student.model.vo.Student" %>
<%@ page import="com.kh.finalProject.employee.model.vo.Employee" %>
<%@ page import="com.kh.finalProject.professor.model.vo.Professor" %>
<% if(session.getAttribute("loginMember") instanceof Professor){%>
<c:set var="userId" value="${loginMember.profId }"/>
<%} else if(session.getAttribute("loginMember") instanceof Student){%>
<c:set var="userId" value="${loginMember.stuNo }"/>
<%} else if(session.getAttribute("loginMember") instanceof Employee){%> 
<c:set var="userId" value="${loginMember.empId }"/>
<%} %>
<style>
	th{
		text-align:center !important;
	}
	td{
		heigth:20px !important;
		text-align:center !important;
	}
	.firsttd{
		width:30px !important;
	}
</style>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
	<div class="content-wrapper">
			   <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Title : ${reqOne.reqTitle }</h4>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <td class="firsttd">보낸 사람</td>
                          <td>관리자</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>받은 시간</td>
                          <td>${reqOne.toTime}</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                          <td>제목</td>
                          <td>${reqOne.reqTitle }</td>
                        </tr>
                        <tr>
                          <td>내용</td>
                          <td>
                          <textarea name="reqContents" cols="40" rows="15" class="form-control" readonly="readonly" disabled>${reqOne.reqContents }</textarea>
                          </td>
                        </tr>
                        <tr>
	                      
		                        <td colspan="2">
		                        	<button class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/reqAnswer.hd?userId=${userId }'">목록으로</button>
		                        </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              
           
           
           
           
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>