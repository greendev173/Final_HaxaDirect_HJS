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
<body style="overflow-y:hidden;overflow-x:hidden;">

<div class="row gap1"></div>
<div class="row" style="">
	<div class="col-12">
		<h4 style="color:black;font-weight:normal;margin:5px;text-align:center;">개설 과목 조회</h4>
	</div>
<!-- 	<div class="col-6">
		<input id="insertSubject" style="width:80px;border:0.5px solid black;background-color:lightgray;float:right;margin:5px;" class="" type='submit' value="등록"/>
	</div> -->
</div>

<div class="row" style="margin:6px;border:2px solid lightgray;height:565px;">
	<div class="col-12">
		<div class="row">
		<div class="col-6">
		<div class="row" style="height:30px;"></div>
			<table class="spacing">
				<tr>
					<th>개설학기</th>
					<td><input id="fn_year" type='text' value="${selectSubjectView.SUB_YEAR }" style="width:65px;" readonly/> 년도 </td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type='text' value="${selectSubjectView.SUB_NAME }" style="width:auto;" readonly></td>
				</tr>
				<tr>
					<th>과목설명</th>
					<td><input type='text' value="${selectSubjectView.TARGET_SUBJECT }" readonly/></td>
				</tr>
				<tr>
					<th>교수명</th>
					<td><input type='text' value="${selectSubjectView.PROF_NAME } " readonly/></td>
				</tr>
				<tr>
					<th>수강학과</th>
					<td><input type='text' value="${selectSubjectView.DEPT_NAME }" readonly/></td>
				</tr>
			</table>
		</div>
		<div class="col-6">
		<div class="row" style="height:30px;"></div>
			<table class="spacing">
				<tr style="height:30px;"></tr>
				<tr>
					<th>과목코드</th>
					<td><input type='text' style="width:105px;color:red;" value="${selectSubjectView.SUB_CODE }" readonly></td>
				</tr>
				<tr style="height:62px;"></tr>
				<tr>
					<th>학과코드</th>
					<td><input type='text' style="width:55px;color:red;" value="${selectSubjectView.DEPT_CODE }" readonly/></td>
				</tr>
			</table>
		</div>
		</div>
				
				
				
		<div class="row">
			<div class="col-6">
					<table class="spacing">
						<tr>
							<th>수강학년</th>
							<td><input type='text' value="${selectSubjectView.TARGET_GRADE }" style="width:25px;" readonly/> 학년</td>
							<%-- <td><div style="text-align:center;">${selectSubjectView.T_GRADE } 학년</div></td> --%>
						</tr>
						<tr>
							<th>단 위</th>
							<td><input style="width:25px;" value="${selectSubjectView.COMPLETE_PT }" type='text' readonly/> 학점</td>
							<%-- <td><div style="text-align:center;">${selectSubjectView.COMPLETE_PT } 학점</div></td> --%>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type='text' value="${selectSubjectView.PHONE }" readonly/></td>
						</tr>
						<tr>
							<th>전공</th>
							<td><input type='text' value="${selectSubjectView.DEPT_NAME }" readonly/></td>
						</tr>
						<tr>
							<th>이수구분</th>
							<td><input type='text' value="${selectSubjectView.SUB_TYPE }" readonly/></td>
						</tr>
						<tr>
							<th>정원</th>
							<td><input type='text' value="${selectSubjectView.CAPACITY }" style="width:40px;" readonly/> 명</td>
						</tr>
					</table>
			</div>
			<div class="col-6">
				<table class="spacing">
					<tr>
						<th>강의시간</th>
						<td>
						
							<%-- <input type='text' value="${selectSubjectView.SUB_TIME }" readonly/> --%>
							<c:set var="subTime" value="${selectSubjectView.SUB_TIME }"/>
					
							<c:if test="${fn:length(subTime) == 11}">
								<input type='text' value='<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>' readonly/>
							</c:if>
							<c:if test="${fn:length(subTime) == 17}">
								<input type='text' value='<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>' readonly/>
							</c:if>
							
						</td>
					</tr>
					<tr>
						<th>강의요일</th>
						<td><input type='text' value="${selectSubjectView.SUB_DATE }요일" style="width:66px;" readonly/></td>
					</tr>
					<tr>
						<th>강의실</th>
						<td><input type='text' value="${selectSubjectView.SUB_ROOM }" style="width:66px;" readonly/></td>
					</tr>
					<tr>
						<th>타교생 허용</th>
						<td><input type='text' value="${selectSubjectView.OPEN_OTHER }" style="width:66px;" readonly/></td>
					</tr>
					<tr>
						<th>교재 사용</th>
						<td>
						<c:set value="${selectSubjectView.USE_BOOK }" var="useBookYn"/>
						<c:if test="${useBookYn eq 'Y'}">
							<input type='text' value="사용" style="width:66px;" readonly/>
						</c:if>
						<c:if test="${useBookYn eq 'N'}">
							<input type='text' value="미사용" style="width:66px;" readonly/>
						</c:if>
						</td>
					</tr>
					<tr>
						<th>교재 제목</th>
						<td><input type='text' value="${selectSubjectView.BOOK_NAME }" readonly/></td>
					</tr>
					<tr>
						<th>강의 계획서</th>
						<td>
						<c:set value="${selectSubjectView.CL_ORIFILENAME }" var="oriFileYn" />
						<c:set value="${selectSubjectView.CL_REFILENAME }" var="reFileYn" />
						<c:if test="${oriFileYn eq '파일없음' && reFileYn eq '파일없음'}">
							<div>파일 없음</div>
						</c:if>
						<c:if test="${oriFileYn ne '파일없음' && reFileYn ne '파일없음'}">
							<button value="${selectSubjectView.CL_ORIFILENAME }" onclick="fileDownload('${selectSubjectView.CL_ORIFILENAME}','${selectSubjectView.CL_REFILENAME }');">강의 계획서</button>
						</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>



		<div class="row" style="height:20px;"></div>
		<div class="row">
			<div class="col-12"> <!-- col-12 start -->
				<table class="spacing">
					<tr>
						<th>평가기준</th>
						<th style="width:50px;">중간</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.MTERM }" readonly/></td>
						<th style="width:50px;">기말</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.FTERM }" readonly/></td>
						<th style="width:50px;">과제</th><td>
						<input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.ASSIGN_1 + selectSubjectView.ASSIGN_2 + selectSubjectView.ASSIGN_3 + selectSubjectView.ASSIGN_4 }" readonly/>
						</td>
						<th style="width:50px;">출석</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.STATUS_GRADE }" readonly/></td>
					</tr>
					<tr>
						<th>과제기준</th>
						<th style="width:50px;">과제A</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.ASSIGN_1 }" readonly/></td>
						<th style="width:50px;">과제B</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.ASSIGN_2 }" readonly/></td>
						<th style="width:50px;">과제C</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.ASSIGN_3 }" readonly/></td>
						<th style="width:50px;">과제D</th><td><input style="width:60px;background-color:snow" type='text' value="${selectSubjectView.ASSIGN_4 }" readonly/></td>
					</tr>
				</table>
			</div> <!-- col-12 End -->
		</div> <!-- row End -->
		
		
	</div> <!-- rowEnd -->
</div>

</body>

<script>
	/* 파일 다운로드 */
	function fileDownload(oName, rName){
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/professor/fileDownLoad?oName="+oName+"&rName="+rName;
	}
</script>

<style>
	input{
		text-align:center;
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
	table tr th{
		text-align:center;
		font-size:13px;
		width:100px;
		background-color:lightgray;
		border:0.5px solid lightgray;
	}
</style>

</html>