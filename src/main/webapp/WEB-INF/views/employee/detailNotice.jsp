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

<c:set var="r" value="${noticeVo }"/>
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
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <td>제목</td>
                          <td >${r.boardTitle}</td>
                        </tr>
                        <c:if test="${noticeAttachment ne null and !empty noticeAttachment }">
                        <tr>
                        	<td>첨부파일</td>
                        	<c:forEach items="${noticeAttachment }" var="a">
                        	<td><button class="btn btn-info" type="button" onclick="fileDownload('${a.oriFileName}', '${a.reFileName }');">${a.oriFileName }</a></td>
                        	</c:forEach>
                        </tr>
                        </c:if>
                      </thead>
                      <tbody>
                        <tr>
                          <td style="width : 10%;">내용</td>
                          <td style="justify-content : center;">
                          <textarea style="width : 80%; "name="boardContent" cols="20" rows="25" class="form-control" readonly="readonly" disabled>${r.boardContent }</textarea>
                          </td>
                        </tr>
                        <tr>
	                        	<td colspan="2">
	                        		<button class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/notice.hd'">목록으로</button>
	                        	</td>
		                     <%--    <td colspan="2">
		                        	<button class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/reqAnswer.hd?userId=${userId }'">목록으로</button>
		                        </td> --%>
                        </tr>
                      </tbody>
                    </table>
                    
                  </div>
                </div>
              </div>
              
<script>
/* 파일 다운로드 */
function fileDownload(oName, rName){
   oName = encodeURIComponent(oName);
   location.href="${pageContext.request.contextPath}/notice/fileDownLoad.hd?oName="+oName+"&rName="+rName;
}

</script>
<%-- 	                        <c:if test="${userId == 'E00000000'}">
	                        </c:if>
	                        <c:if test="${userId != 'E00000000'}">
	                        </c:if> --%>
              
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>