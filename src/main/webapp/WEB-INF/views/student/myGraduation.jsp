<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
	table, tr, td, th {
	 	cursor: auto;
	 }
	 
	 /* ui 테스트용 */
	/* div { 
	 	border: 1px solid black;
	 } */
	 
	 .divMarginBottom {
	 	margin-bottom: 7px;
	 }
	  .divMarginLeft {
	 	margin-left: 13px;
	 }
	 .textAlignCenter {
	 	text-align:center;
	 }
	 .textAlignRight {
	 	text-align:right;
	 }
</style>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">졸업인정 학점 조회</h4>
					</div>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body" style="padding-bottom:13px;">
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								학번: ${graduationCon.stuNo}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								성명: ${graduationCon.stuName}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								생년월일: ${birthday}
							</h5></div>
							<div class="divMarginBottom divMarginLeft"><h5 class="font-weight-bold mb-0">
								학과: ${graduationCon.deptName}
							</h5></div>
						</div>
						<div class="card-body" style="padding-top:3px; padding-bottom:3px;">
						<div class="table-responsive">
							<table class="table table-hover table-striped">
								<thead class="thead-dark">
									<tr>
										<th class="textAlignCenter">구분</th>
										<th class="textAlignCenter">졸업 가능 학점</th>
										<th class="textAlignCenter">취득 학점</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">전공</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="psblMajCr"></div></td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="myMajCr"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">교양</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="psblLibCr"></div></td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="myLibCr"></div></td>
									</tr>
									<tr>
										<td class="font-weight-bold mb-0 textAlignCenter">총합계</td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="totalPsblCr"></div></td>
										<td class="font-weight-bold mb-0 textAlignCenter"><div id="totalMyCr"></div></td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div class="card-body" style="padding-top:13px; padding-bottom:30px;">
							<div class="divMarginBottom divMarginLeft font-weight-bold">
								<div class="textAlignCenter" id="todayDate"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		<script>
		function getFormatDate(date) { // yyyyMMdd 포맷으로 변환하는 함수
		    var year=date.getFullYear(); // yyyy
		    var month=(1+date.getMonth()); // M
		    month=month>=10?month:'0'+month; // month 두자리로 저장하기
		    var day=date.getDate(); // d
		    day=day>=10?day:'0'+day; // day 두자리로 저장
		    return year+'년 '+month+'월 '+day+'일';
		}
		
			var psblMajCr=0;
			var myMajCr=0;
			var psblLibCr=0;
			var myLibCr=0;
			
			psblMajCr=${graduationCon.psblMajCr};
			// console.log("psblMajCr:"+psblMajCr);
			myMajCr=${graduationCon.myMajCr};
			psblLibCr=${graduationCon.psblLibCr};
			myLibCr=${graduationCon.myLibCr};
			
			var totalPsblCr=psblMajCr+psblLibCr;
			var totalMyCr=myMajCr+myLibCr;
		
			$("#psblMajCr").html(psblMajCr+" 학점");
			$("#myMajCr").html(myMajCr+" 학점");
			$("#psblLibCr").html(psblLibCr+" 학점");
			$("#myLibCr").html(myLibCr+" 학점");
			$("#totalPsblCr").html(totalPsblCr+" 학점");
			$("#totalMyCr").html(totalMyCr+" 학점");
			
			
			var today=new Date();
		    //console.log("today:"+getFormatDate(today));
		    
			$("#todayDate").html(getFormatDate(today));
		</script>


			<jsp:include page="/WEB-INF/views/common/footer.jsp" />