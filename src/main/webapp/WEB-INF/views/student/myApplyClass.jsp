<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>


	<style>

		tr, td, th {
			text-align: left;
			font-size: 13px;
			border:1px solid lightgray;
			cursor: auto;
		}
		
		input{
			width:100px;
		}
	
		

		.marginLeft {
			margin-left:10px;
		}
		.btn btn-outline-primary btn-sm{
			
		}
		#classInfo>tr{
		font-size:25px;
		}
		
		#classInfoTitle>th{
		border:1px solid Lightgray;
		font-size:16px;
		font-family:arial;
		text-align:center;
		}
		
		#classInfo>td{
		border:1px solid Lightgray;
		font-size:16px;

		}
		/* button>*{
			height:28px;
			font-size:20px;
			font-weight:bold;
			
		} */
		
		.form-control{
		font-size: 12px;
		width:120px;
		height:30px;
		padding:5px;
		display:inline-block;
		}
		
		
		#Progress_Loading{
	 position: absolute;
	 left: 50%;
	 top: 50%;
	 background: #ffffff;
	  background-color: rgba( 255, 255, 255, 0.2 );
		}
		
		

		
	</style>
	
	
	<div class="main-panel">
	<div class="content-wrapper">
	
				
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
					
	
	<table class="table table-default table-striped" id="mainContent">
	<thead class="thead-dark">
	<tr>
	</tr>
      <tr>
        <th colspan="11" style="font-size:25px;font-family:arial">나의 수강신청 내역</th>
      </tr>
    </thead>
    	<form method="post" action="${path }/student/selectMyClass.hd">
    	
				<tr>
				<td>이수구분
				<select class="form-control" id="chk_isu" name="chk_isu" style="width:100px;color:black">
					<option value="">전체</option>
					<option value="전공필수">전공필수</option>
					<option value="교양필수">교양필수</option>
					<option value="전공선택">전공선택</option>
					<option value="교양선택">교양선택</option>
				</select>
				</td>
				
				<td>학부검색
				<select class="form-control" id="chk_school" name="chk_school" style="width:100px;color:black">
					<option value="">선택</option>
					<option value="A">인문대학</option>
					<option value="B">공과대학</option>
					<option value="C">경영대학</option>
				</select>
				
				<td>학과검색
				<select class="form-control" id="chk_dept" name="chk_dept" style="width:160px;color:black">
					<option id="school0" value="">학과를선택하세요</option>
					<option id="school1" value=""></option>
					<option id="school2" value=""></option>
					<option id="school3" value=""></option>
				</select>
			
				<td>개설년도
				<select class="form-control" id="chk_year" name="chk_year" style="color:black;">
					<option value="">전체</option>
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				
				<td>개설학기
				<select class="form-control" id="chk_sem" name="chk_sem" style="width:70px;color:black;">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</td>
				
				</td>
				<td >교과목명검색
				<input class="form-control" type="text" name="chk_subName" style="display:inline-block;width:150px;color:black"/>
				&nbsp<button style="font-size:12px;font-weight:bold;height:25px;display:inline-block" class="btn btn-primary btn-xs"type="submit">검색</button>
				</td>
				</tr>
				</table>
				
				</form>
				<br>
				<br>
				<table class="table table-sm table-hover table-striped">
				<tr>
				<thead class="thead-light">
				      <tr>
				        <th colspan="13" style="font-size:25px;font-family:arial">신청내역</th>
				      </tr>
				    </thead>
				</tr>
				<tr id="classInfoTitle">
				<th>순번</th>
				<th>학기</th>
				<th>교과목명</th>
				<th>과목명</th>
				<th>담당교수</th>
				<th>이수구분</th>
				<th>이수학점</th>
				<th>강의시간</th>
				<th>현재수강여석</th>
				<th>강의실</th>
				<th>취소</th>
				<th>신청결과</th>
				</tr>
				
				
				<c:if test='${!empty list}'>
				<c:forEach items="${list}" var="e" varStatus="v">
				
				
				
				
				<tr id="classInfo">
				<td><c:out value='${e["ROWNUM"] }'/></td>
				<td><c:out value='${e["SUB_YEAR"]}'/>-<c:out value='${e["SUB_SEMESTER"]}'/></td>
				<td><c:out value='${e["DEPT_NAME"] }'/></td>
				<td><c:out value='${e["SUB_NAME"] }'/></td>
				<td><c:out value='${e["PROF_NAME"] }'/></td>
				<td><c:out value='${e["SUB_TYPE"] }'/></td>
				<td>최대: <c:out value='${e["COMPLETE_PT"] }'/></td>
				<td>매주: <c:out value='${e["SUB_DATE"] }'/> <c:out value='${e["SUB_TIME"] }'/></td>
				
				<td><c:out value='${e["PRE_CAPA"] }'/>/<c:out value='${e["CAPACITY"] }'/></td>
				
				<td><c:out value='${e["SUB_ROOM"] }'/></td>
				
				
				<td style="text-align:center">
				<c:if test='${applyDay["PLAN_NO_SEQ"] ne null and applyDay["PLAN_NO_SEQ"] ne ""}'>
				<button id="button-cancelClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="cancelClass(this.id,this.value)" class="btn btn-danger btn-xs"
				value='${loginMember.stuNo},${e["SUB_SEQ"]}'>취소</button>
				</c:if>
				</td>		
				
				<td style="text-align:center">
				<c:if test='${applyDay["PLAN_NO_SEQ"] ne null and applyDay["PLAN_NO_SEQ"] ne ""}'>
				수업신청대기중
				</c:if>

				
				<c:if test='${applyDay["PLAN_NO_SEQ"] eq null or applyDay["PLAN_NO_SEQ"] eq ""}'>
				<c:if test='${e.DEPT_OPEN eq "Y"}'>
				수업신청확정
				</c:if>
				<c:if test='${e.DEPT_OPEN eq "N"}'>
				폐강되었습니다.
				</c:if>
				</c:if>
				</td>
				</tr>
				</c:forEach>
				</c:if>
				</table>
				<c:if test='${empty list}'>
				
				<table style="width:100%">
				<tr>
				<td style="text-align:center">
				
				<img id="LoadImg" height="300px" width="500px" style="padding:20px" src="${path}/resources/images/image/selectNothing.jpg"/>
			
				</td>
				</tr>
				</table>
				</c:if>
				<br><br>
				${pageBar}
				<form name="popForm">
			    <input type="hidden" id="profEvalForm" name="profEvalForm" value=""/>
				</form>
				
				

	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	
	
	<div id = "Progress_Loading"><!-- 로딩바 -->
	<img id="LoadImg" height="50px" width="50px" src="${path }/resources/images/image/prograssLoading.gif"/>
	</div>


 	
 	
 	
	<script>
	$(document).ready(function(){
 		
	 	   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
	 	})
	 	.ajaxStart(function(){
	 		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	 	})
	 	.ajaxStop(function(){
	 		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	 	});
	 	
	
	
	
	
		/* 년도 띄워주기 */
		var today = new Date();
		var yyyy = today.getFullYear();
		
		$("#thisYear").attr("value",yyyy);
		$("#thisYear").text(yyyy);
		$("#year2").attr("value",(yyyy-1));
		$("#year2").text((yyyy-1));
		
		$("#year3").attr("value",(yyyy-2));
		$("#year3").text((yyyy-2));
		
		$("#year4").attr("value",(yyyy-3));
		$("#year4").text((yyyy-3));
		
		$("#year5").attr("value",(yyyy-4));
		$("#year5").text((yyyy-4));
		
	
		
		$('#chk_school').change(function () {
			
			if (!$(this).val()) {
				 
				$("#school1").attr("value","");
				$("#school1").text("");
				$("#school2").attr("value","");
				$("#school2").text("");
				$("#school3").attr("value","");
				$("#school3").text("");
		  }
			  if ($(this).val() === 'A') {
				 
					$("#school1").attr("value","국어국문학과");
					$("#school1").text("국어국문학과");
					$("#school2").attr("value","영어영문학과");
					$("#school2").text("영어영문학과");
					$("#school3").attr("value","철학과");
					$("#school3").text("철학과");
			  }
			  else if ($(this).val() === 'B') {
				
				 	$("#school1").val("기계공학과");
					$("#school1").text("기계공학과");
					$("#school2").val("컴퓨터공학과");
					$("#school2").text("컴퓨터공학과");
					$("#school3").val("전자공학과");
					$("#school3").text("전자공학과");
			  }
			  else if ($(this).val() === 'C') {
					 
				  	$("#school1").val("호텔관광학과");
					$("#school1").text("호텔관광학과");
					$("#school2").val("회계학과");
					$("#school2").text("회계학과");
					$("#school3").val("경영학과");
					$("#school3").text("경영학과");
			  }
			});
		
		
	
		
 	function cancelClass(id,value){
			
 		if (confirm("취소하시겠습니까?") == true){    //확인
 			
 			var data={value};
			 $.post({
		            url: "${path}/student/cancelMyClass.hd",
		            type: "post",
		            data: data,
		            success: function(data){
		                	alert("재신청은 기간내 조회/신청페이지에서 가능합니다");
		                	location.href="${path}/student/myClassInfo.hd"; 
		                	
		            },
		            error: function(){
		                alert("에러처리");
		            }
		        });
		 }else{   //취소

		     return false;

		 }
 		
 		
			
			 
 	}
		
	
	
	</script>
	
	
		 

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>