<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
#choiceClass select, #choiceYear select, #choiceSeme select {
	color: black;
}
</style>

<div class="main-panel">
	<div class="content-wrapper">
	
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">과제 제출 조회</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
				<form action="${path }/prof/viewObjection.hd" method="post">
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">조회 대상 강의 설정</h3>
						<div class="row">
							<div class="col-md-3" id="choiceClass">
								<label for="choiceClass" class="text-warning">강의선택</label> 
									<select name="subCode" class="form-control form-control-sm" required>
											<option value="" selected>과목선택</option>
											<c:forEach items="${nameCodeList }" var="subList">
												<option value="${subList.subCode }">${subList.subName }</option>
											</c:forEach>
									</select>
							</div>
							<div class="col-md-3" id="choiceYear">
								<label for="subYear" class="text-warning">연도선택</label>
								<select class="form-control">
									<option>2019</option>
									<option>2018</option>
									<option>2017</option>
								</select>
							</div>
							<div class="col-md-3" id="choiceSeme">
								<label for="subSemester" class="text-warning">학기선택</label> 
								<select	class="form-control">
									<option>1학기</option>
									<option>2학기</option>
								</select>
							</div>
							<div class="col-md-3">
								<label for="submitButton36" class="text-warning">검색하기(클릭)</label>
								<button id="submitButton36" type="submit"
									class="btn btn-block btn-warning">검색
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!--  -->
		
		
		
		<div class="row" style="text-align : center;">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h2>#영문학기초 과제 게시판</h2>
					</div>
					<div class="card-body">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>작성자</th>
										<th>제목</th>
										<th>작성일자</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${reqList }" var="l">
									<tr>
										<td>${l.stuName }</td>
										<td>
										
										<button class="btn btn-success btn-toggle btn-block" onclick="popupBoard('${l.reqTitle }','${l.reqContent}','${l.stuName }','${l.profId }','${l.reqAnswer }','${l.reqDate }','${l.subCode }','${l.acaYearSem }','${l.stuNo }');">${l.reqTitle }</button>
												</td>
										<td>${l.reqDate }</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
					</div>
					<div class="card-footer">
						${pageBar }
					</div>
				</div>
			</div>
		</div>
		<!-- 본문 끝 -->
		<!-- 게시판 내용 모달 시작  -->
		
		<!-- 게시판 내용 모달 끝  -->
		<!-- 게시판 내용  스크립트 시작 -->
			<script>
			//모달  게시판 내용 삽입
				
				function popupBoard(title, content, writer, profId, answer, reqDate,subCode, acaYearSem ,stuNo){
				
				var url = "${path}/prof/popupReqBoard?reqTitle="+title+"&reqContent="+content+"&stuName="+writer+"&profId="+profId+"&reqAnswer="+answer+"&reqDate="+reqDate+"&subCode="+subCode+"&acaYearSem="+acaYearSem+"&stuNo="+stuNo;
				var width = 1176;
				var height = 768;
				var option = "width="+width+", height="+height+",top = 80 , left = 400, location = yes";
				window.open(url,"RequestContent",option);
				
				
				}
			
			/* function createModal(title, content, writer){ 
				var string ="";
				var showModal = document.getElementById("showModal");
				
				string += "<div class='modal fade' id='boardModal'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'>"+title+"</div><div class='modal-body'>"+content+"</div><div class='modal-footer'>작성자 : "+writer+"</div></div></div></div>";
				string += "<script>";
				string += "$(document).ready(function()";
				string += "{$('head').append('<style type='text/css'>.modal .modal-body {max-height:"
				string += "+ ($('body').height() * 7)";
				string += "+ 'px;overflow-y: center;}.modal-open .modal{overflow-y: hidden !important;}</style>');";
				string += "});";
				string += "<";
				string += '/script>';
				showModal.innerHTML = string;
			} */
			</script>
		
			
			
			
			
				<script>
			//=========
			//모달 띄우기
					/* $(document).ready(function() 
							{$('head').append('<style type="text/css">.modal .modal-body {max-height:
							+ ($('body').height() * .7)
							+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
							});
				// 모달창 닫음
				
				/* function createModal(title, content, writer){ 
				var showModal = document.getElementById("showModal");
				showModal.innerHTML += "		
				<div class='modal fade' id='myModal'>
					<div class='modal-dialog'>
						<div class='modal-content'>
							
							<div class='modal-header'>
							 title
							</div>
							<div class='modal-body'>
							content
							</div>
							<div class='modal-footer'>
							writer
							</div>
							
						</div>
					</div>
				</div>";
			} */
			</script>
		<!-- 게시판 내용  스크립트 끝 -->
		
		



	<!-- Main-content End -->

	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />