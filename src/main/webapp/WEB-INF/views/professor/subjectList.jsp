<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개설 과목 조회</title>
</head>
<body style="overflow-y:auto;overflow-x:hidden;">

<div class="row gap1"></div>
	<table class="table table-hover">
		<tr>
			<th>개설년도</th>
			<th>강의대상 학년</th>
			<th>학기구분</th>
			<th>교과목명</th>
			<th>이수학점</th>
			<th>과목코드</th>
			<th>강의대상 학과</th>
			<th>강의목표</th>
			<th>이수구분</th>
			<th>학과번호</th>
			<th>강의실</th>
			<th>강의요일</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${list }" var="subject">
			<tr>
				<input class="subTime" type='hidden' value="${subject.SUB_TIME }"/>
				<input class="subYear" type='hidden' value="${subject.SUB_YEAR }"/>
				<input class="targetGrade" type='hidden' value="${subject.TARGET_GRADE }"/>
				<input class="subSemester" type='hidden' value="${subject.SUB_SEMESTER }"/>
				<td class="subYear">${subject.SUB_YEAR }</td>
				<td>${subject.TARGET_GRADE }학년</td>
				<td>${subject.SUB_SEMESTER }학기</td>
				<td><input style="color:blue;" type='button' class="btn btn-default selectSubject" value="${subject.SUB_NAME }"/></td>
				<td>${subject.COMPLETE_PT }점</td>
				<td>${subject.SUB_CODE }</td>
				<td>${subject.DEPT_NAME }</td>
				<td>${subject.TARGET_SUBJECT }</td>
				<td>${subject.SUB_TYPE }</td>
				<td>${subject.DEPT_CODE }</td>
				<td>${subject.SUB_ROOM }</td>
				<td>${subject.SUB_DATE }</td>
				<td>
					<c:set var="subTime" value="${subject.SUB_TIME }"/>
					
					<c:if test="${fn:length(subTime) == 11}">
					<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>
					</c:if>
					<c:if test="${fn:length(subTime) == 17}">
					<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>
					</c:if>
					<%-- ${subject.SUB_TIME } --%>
					
				</td>
			</tr>
			<input type='hidden' value="${subject.SUB_SEQ }"/>
		</c:forEach>

	</table>

<%-- <div>${pageBar }</div> --%>

</body>

<script>
$(function(){
	$(".selectSubject").click(function(){
		var subCode = $(this).parent().next().next().html();
		/* var subTime = $(this).parent().next().next().next().next().next().next().next().next().next().html(); */
		var subTime = $(this).parent().parent().find($(".subTime")).val();
		var subYear = $(this).parent().parent().find($(".subYear")).val();
		var targetGrade = $(this).parent().parent().find($(".targetGrade")).val();
		var subSemester = $(this).parent().parent().find($(".subSemester")).val();
		console.log(subCode);
		console.log(subTime);
		console.log(subYear);
		console.log(targetGrade);
		console.log(subSemester);
		window.opener.selectSubject(subCode,subTime,subYear,targetGrade,subSemester);
		self.close();
	});
});


</script>

<style>
	select[class="selectBox"]{
		appearance: none;
	}
/* 	div{
		border:0.2px solid coral;
	} */
	.gap1{
		height:30px;
	}
	.gap2{
		height:80px;
	}
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
	table tr{
		
		text-align:center;
		font-size:13px;
		width:100px;
		border:0.5px solid lightgray;
	}
	table tr th{
		background-color:lightgray;
	}
</style>

</html>