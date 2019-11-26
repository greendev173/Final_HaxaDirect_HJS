<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
		table {
			width: 100%;
		}

		.marginLeft {
			margin-left:10px;
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
		.form-control{
		font-size: 12px;
		width:70px;
		height:30px;
		padding:5px;
		display:inline-block;
		}
	select {
		
			color:black;
			
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
					
	
	<table class="table table-default table-striped">
	<thead class="thead-dark">
	<tr>
	</tr>
      <tr>
        <th colspan="11" style="font-size:25px;font-family:arial">강의조회/신청</th>
      </tr>
    </thead>
    	<form method="post" action="${path }/student/selectClass.hd">
    	
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
				<select class="form-control" id="chk_year" name="chk_year" style="color:black">
					<option value="">전체</option>
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				
				<td>개설학기
				<select class="form-control" id="chk_sem" name="chk_sem" style="width:70px;color:black">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</td>
				
				</td>
				<td >교과목명검색
				<input class="form-control" data-toggle="tooltip" type="text" name="chk_subName" style="display:inline-block;width:150px"/>
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
				        <th colspan="13" style="font-size:25px;font-family:arial">강의 시간표</th>
				      </tr>
				    </thead>
				</tr>
				<tr id="classInfoTitle">
				<th>순번</th>
				<th>학기</th>
				<th>학과</th>
				<th>과목명</th>
				<th>담당교수</th>
				<th>이수구분</th>
				<th>타전공여부</th>
				<th>이수학점</th>
				<th>강의시간</th>
				<th>수강여석</th>
				<th>강의실</th>
				<th>수강평</th>
				<th>신청/철회</th>
				</tr>
				
				<h6 style="font-size:12px;color:red">
				<c:if test='${applyDay["PLAN_NO_SEQ"] ne null and applyDay["PLAN_NO_SEQ"] ne ""}'>
				이번학기 수강신청 가능일은 
				<fmt:formatDate value='${applyDay["PLAN_START_DATE"]}' pattern="MM월 dd일"/> ~ <fmt:formatDate value='${applyDay["PLAN_END_DATE"]}' pattern="MM월 dd일"/>
				까지입니다 신청기간 이후에는 신청이 불가하니 꼭 기간을 확인하시어 신청해주시기 바랍니다.
				</c:if>
				
				<c:if test='${applyDay["PLAN_NO_SEQ"] eq null or applyDay["PLAN_NO_SEQ"] eq ""}'>
				<h6 style="font-size:12px;color:red">수강신청 기간이 아닙니다</h6>
				</c:if>
				
				</h6>
				<c:if test="${!empty list}">
				<c:forEach items="${list}" var="e" varStatus="v">
				<tr id="classInfo">
				<td><c:out value='${e["ROWNUM"] }'/></td>
				
				<td><c:out value='${e["SUB_YEAR"]}-${e["SUB_SEMESTER"]}'/></td>
		
				<td><c:out value='${e["DEPT_NAME"] }'/></td>
				<td><c:out value='${e["SUB_NAME"] }'/></td>
				
				<td><c:out value='${e["PROF_NAME"] }'/></td>
				<td><c:out value='${e["SUB_TYPE"] }'/></td>
				<td>
					<c:if test="${fn:substring(e.DEPT_CODE,0,2) eq fn:substring(stuInfo.DEPT_CODE,0,2)}">전공과목</c:if>
					<c:if test="${fn:substring(e.DEPT_CODE,0,2) ne fn:substring(stuInfo.DEPT_CODE,0,2)}">타전공</c:if>
				</td>
				<td>최대: <c:out value='${e["COMPLETE_PT"] }'/></td>
				<td>매주: <c:out value='${e["SUB_DATE"] }'/> <c:out value='${e["SUB_TIME"] }'/></td>
				<td><c:out value='${e["PRE_CAPA"] }'/>/<c:out value='${e["CAPACITY"]}'/></td>
				<td><c:out value='${e["SUB_ROOM"] }'/></td>
				
				<td style="text-align:center">
				<button id='button-profEval' style="font-size:12px;font-weight:bold;height:25px;" class="btn btn-primary btn-xs" onclick="profEval(this.value)" 
				value='${e["SUB_NAME"]},${e["PROF_ID"]},${e["SUB_YEAR"]}-${e["SUB_SEMESTER"]}'>보기 
				</button>
				</td>
				
				<td style="text-align:center">
				
				<c:if test='${applyDay["PLAN_NO_SEQ"] eq null or applyDay["PLAN_NO_SEQ"] eq ""}'>
				
				</c:if>
				
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
				<c:set var="sysSem"><fmt:formatDate value="${now}" pattern="MM" /></c:set>
				
			 	<c:if test="${sysSem le 6}"><c:set var="sysSem">1</c:set></c:if>
			 	<c:if test="${sysSem gt 7}"><c:set var="sysSem">2</c:set></c:if> 
				<c:set var="sysYs">${sysYear}-${sysSem}</c:set>
				<c:set var="classYs">${e["SUB_YEAR"]}-${e["SUB_SEMESTER"]}</c:set>
				 
				 
				
				
				
				<c:if test="${sysYs eq classYs}">
				<c:if test='${applyDay["PLAN_NO_SEQ"] ne null and applyDay["PLAN_NO_SEQ"] ne ""}'>	
				<c:if test='${ e["PRE_CAPA"]-e["CAPACITY"] eq 0}'>
				<button id="button-applyClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="applyClass(this.id,this.value)" class="btn btn-primary btn-xs"
				value='${loginMember.stuNo },${e["SUB_SEQ"]},${e["CAPACITY"]}' disabled>정원초과</button>
				</c:if>
				<c:if test='${e["STU_NO"] ne loginMember.stuNo and e["PRE_CAPA"]-e["CAPACITY"] ne 0}'>
				<button id="button-applyClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="applyClass(this.id,this.value)" class="btn btn-primary btn-xs"
				value='${loginMember.stuNo },${e["SUB_SEQ"]}'>신청</button>
				</c:if>
				
				<c:if test='${e["STU_NO"] eq loginMember.stuNo}'>
				<button id="button-cancelClass" style="font-size:12px;font-weight:bold;height:25px;" onclick="cancelClass(this.id,this.value)" class="btn btn-danger btn-xs"
				value='${loginMember.stuNo},${e["SUB_SEQ"]}'>취소</button>
				</td>		
				</c:if>
				</c:if>			
				</c:if>
				
				<c:if test="${sysYs ne classYs}">
				
				</c:if>
				
				<c:if test='${empty list}'>
				<td></td>
				<td></td>
				</c:if>
				</td>
				</tr>
				
				</c:forEach>
				
				</table>
				</c:if>
				<c:if test='${empty list}'>
				</table>
				<table>
				<tr id=classInfo>
				<td style="text-align:center">
				<img id="LoadImg" height="300px" width="400px" style="padding:20px;"src="${path}/resources/images/image/selectNothing.jpg"/>
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
		<img id="LoadImg" height="60px" width="60px" src="${path }/resources/images/image/prograssLoading.gif"/>
	</div>
	
	
	
	<script>
	
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
	
				function profEval(value){
					
					$("#profEvalForm").attr("value",value);
				
					 var myForm = document.popForm;
					 var url= "${path}/student/profEval.hd";    //팝업창 페이지 URL
					 var winWidth = 1000;
				     var winHeight = 1000;
				     var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
					
				   
				    window.open("" ,"popForm",
						       "toolbar=no, width=1000, height=700, directories=no, status=no,scrollorbars=no, resizable=no");
				    myForm.action =url;
					myForm.method="post";
					myForm.target="popForm";
					myForm.submit();
					
				}
			
		
		
		function applyClass(id,value){
			if (confirm("신청하시겠습니까??") == true){    //확인
				
				 $.post({
					 
			            url: "${path}/student/applyClass.hd",
			            type: "post",
			            data: {"value":value},
			            dataType:"json",
			            success: function(data){
			            	
			            		if(data.capacityFull){
			            			alert("최대인원 초과입니다. 다른 수업을 신청하세요")
			            		}else{
			            			alert("신청완료 됐습니다")
				                	$("#applyButton").html("")
				                	location.href="${path}/student/applyClass.hd";
			            		}
			                
			                	
			            },
			            error: function(){
			                alert("에러발생 관리자에게 문의하세요");
			            }
			        });
				
				
			 }else{   //취소

			     return false;

			 }
			
			
			
			
			 
		   
		  
		}
		  
	
	
		
 	function cancelClass(id,value){
			
 		if (confirm("취소하시겠습니까?") == true){    //확인
 			
 			
			 $.post({
		            url: "${path}/student/cancelClass.hd",
		            type: "post",
		            data: {"value":value},
		            success: function(data){
		                	alert("정상취소 됐습니다");
		                	location.href="${path}/student/applyClass.hd"; 
		                	
		            },
		            error: function(){
		                alert("에러처리");
		            }
		        });
		 }else{   //취소

		     return false;

		 }
 		
 		
			
			 
 	}
		
 	$(document).ready(function(){
 		
 	   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
 	})
 	.ajaxStart(function(){
 		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
 	})
 	.ajaxStop(function(){
 		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
 	});
 	
 	
	
 	
 	
 	
 	
	</script>
	
	
		 

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>