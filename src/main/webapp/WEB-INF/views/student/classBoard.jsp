<%@page import="com.kh.finalProject.student.model.vo.MyClass"%>
<%@page import="com.kh.finalProject.professor.model.vo.AssignmentRegister"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%
List<AssignmentRegister> arList=null;
List<MyClass> myClassList=null;
	if(request.getAttribute("arList")!=null) {
		arList=(ArrayList)request.getAttribute("arList");
	}
	if(request.getAttribute("myClassList")!=null) { 
		myClassList=(ArrayList)request.getAttribute("myClassList");
	}
	
	String curSubSeq=(String)request.getAttribute("curSubSeq");
	
%>
<style>
	/* div {
		border: 1px solid black;
	} */
	.table td {
		text-align:center;
	}
	th {
		text-align:center;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div id="assignmentTitle">
						<h4 class="font-weight-bold mb-0">
						<c:out value="${acaYear}"/>학년도 <c:out value="${acaSemester}"/>학기
						<input type="hidden" id="acaYearSem" value="<c:out value='${acaYear}'/>학년도 <c:out value='${acaSemester}'/>학기"/>
						<% for(int i=0; i<myClassList.size(); i++) { 
							if(curSubSeq!=null) {
								if(myClassList.get(i).getSubSeq().equals(curSubSeq)) { %>
								[<%=myClassList.get(i).getSubName() %>] <%=myClassList.get(i).getSubDate() %>(<%=myClassList.get(i).getSubTime()%>)&nbsp;과제 게시판
								<input type="hidden" id="subSeq" value="<%=myClassList.get(i).getSubSeq()%>"/>
								<input type="hidden" id="subName" value="<%=myClassList.get(i).getSubName()%>"/>
						<% 		}
							}else { %>
								[<%=myClassList.get(0).getSubName() %>] <%=myClassList.get(0).getSubDate() %>(<%=myClassList.get(0).getSubTime()%>)&nbsp;과제 게시판
								<input type="hidden" id="subSeq" value="<%=myClassList.get(0).getSubSeq()%>"/>
								<input type="hidden" id="subName" value="<%=myClassList.get(0).getSubName()%>"/>
						<% 		break;
							}
						} %>
						</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<!-- <form class="forms"> -->
					<div class="card-header">
						<div class="row">
							<div class="col-4" id="choiceClass">
							<label for="choiceClass" class="text-warning fontBlack" style="font-weight:bold;">강의 선택</label>
								<select class="form-control" style="color:black;" id="subjectName">
								<% 
								for(int i=0; i<myClassList.size(); i++) {
									if(curSubSeq!=null) { 
										if(myClassList.get(i).getSubSeq().equals(curSubSeq)) { // curSubSeq과 같으면 %>
										<option value="<%=myClassList.get(i).getSubSeq()%>" selected="selected">[<%=myClassList.get(i).getSubName() %>] <%=myClassList.get(i).getSubDate() %>(<%=myClassList.get(i).getSubTime()%>)</option>
									<% 	}else { // curSubSeq과 같지 않으면 %>
										<option value="<%=myClassList.get(i).getSubSeq()%>">[<%=myClassList.get(i).getSubName() %>] <%=myClassList.get(i).getSubDate() %>(<%=myClassList.get(i).getSubTime()%>)</option>
									<%	}
									}else { // curSubSeq가 null이면 %>
										<option value="<%=myClassList.get(i).getSubSeq()%>">[<%=myClassList.get(i).getSubName() %>] <%=myClassList.get(i).getSubDate() %>(<%=myClassList.get(i).getSubTime()%>)</option>
								<% 	}
									%>
								<%	
								} %>
								</select>
							</div>
						</div>
					</div>
					<!-- </form> -->
					<!----------------------- 게시판 시작 --------------->
					<div class="card-body">
						<div class="row">
							<div class="col-12">
							<h5>총 ${totalCount }건의 과제가 있습니다.</h5>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
							<div class="table-responsive">
								<table class="table">
									<tr style="background-color:#c9ebd1;">
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>첨부파일</th>
										<th>조회수</th>
									</tr>
									<c:forEach items="${arList }" var="arL">
									<c:if test="${arL!=null }">
									<tr>
										<td style="width:80px;">${arL.asgmtNo}</td>
										<td style="width:100px;"><a href="${path }/student/selectAssignment?subSeq=${arL.subSeq}&asgmtNo=${arL.asgmtNo}&acaYear=${acaYear}&acaSemester=${acaSemester}&cPage=${cPage}">${arL.asgmtRegdTitle}</a></td>
										<td style="width:100px;">${arL.profName}</td>
										<td style="width:70px;"><fmt:formatDate value="${arL.asgmtRegdDate }" pattern="yyyy/MM/dd HH:mm:ss"/></td>
										<td style="width:100px;">
											<c:if test="${ arL.asgmtRegdOrifileName ne null}">
												<div style="color:#ac6969; font-weight:bold;"><c:out value="${ arL.asgmtRegdOrifileName}"/></div>
											</c:if>
											<c:if test="${ arL.asgmtRegdOrifileName eq null}">
												파일 없음
											</c:if>
										</td>
										<td style="width:50px;"><c:out value="${ arL.readCount}"/></td>
									</tr>
									</c:if>
									</c:forEach>
									<c:if test="${empty arList}">
									<tr>
										<td colspan="6">등록된 과제가 아직 없습니다.</td>
									</tr>
									</c:if>
								</table>
								</div>
							<div style="height:25px;"></div>
							<div>${pageBar }</div>
							</div>
							<div class="col-6">
							<!-- <form action="" method="post">
							<input type='text' class='btn' style="border:0.5px solid black;"/>
							<input type='submit' class='btn btn-dark' value='검색'/>
							</form> -->
							</div>
						</div>
					</div>
					<!----------------------- 게시판  끝 --------------->
					
				</div>
			</div>
		</div>
	</div>

<script>
	<c:if test="${!empty myClassList }">
	$("#subjectName").change(function() {
		alert($("#subjectName option:selected").text()+" 과목 게시판을 조회합니다."); 
		$("#assignmentTitle").html("<h3 class='font-weight-bold mb-0'><c:out value='${acaYear}'/>학년도 <c:out value='${acaSemester}'/>학기 "+$("#subjectName option:selected").text()+" 과제 게시판"+"</h3>");
		location.href="${path}/student/classBoard.hd?subSeq="+$(this).val();
	});
	
	</c:if>
</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />